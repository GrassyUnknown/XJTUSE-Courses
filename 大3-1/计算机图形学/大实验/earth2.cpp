#include <GL/glut.h>
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>

static float angle = 0.0f;

static int oldX;//�����λ��
static float rotX = 0;
static float rotY = 0;
static float xyz[3] = { 1,1,1 };
static float r = 80;//����뾶
static float rout = 92;
static float rin = 7;//Բ���뾶
static float incAngle = 15.0f;//���
static float basePos = -120.0f;//����λ��
static float axiPos = 90;//��λ��



static GLUquadric* earth;//�������

#define BMP_Header_Length 54  //ͼ���������ڴ���е�ƫ����

//�������������
GLuint texEarth;



//��ʼ������
void initLight() {
    GLfloat	ambientLight[] = { 0.2, 0.2, 0.2, 1 };
    GLfloat diffuseLight[] = { 0.8, 0.8, 0.8, 1 };
    GLfloat specularLight[] = { 0.5, 0.5, 0.5, 1 };
    GLfloat posLight[] = { 400, 250, 1, 1 };
    GLfloat	specref[] = { 1, 1, 1, 1 };

    glLightModelfv(GL_LIGHT_MODEL_AMBIENT, ambientLight);
    glLightfv(GL_LIGHT0,GL_POSITION,posLight); //ָ����Դλ��
    glLightfv(GL_LIGHT0, GL_AMBIENT, ambientLight);
    glLightfv(GL_LIGHT0, GL_DIFFUSE, diffuseLight);
    glLightfv(GL_LIGHT0, GL_SPECULAR, specularLight);

    glMaterialf(GL_FRONT_AND_BACK, GL_SHININESS, 128);
}

//��ʼ��
void initRendering() {
    //�����������
    earth = gluNewQuadric();

    //��ʼ������
    initLight();

    glEnable(GL_LIGHT0);
    glEnable(GL_LIGHTING);
    glEnable(GL_DEPTH_TEST);
    glEnable(GL_LINE_SMOOTH);
}

// �ж��ǲ���2����������
int power_of_two(int n) {
    if (n <= 0) {
        return 0;
    }
    return (n & (n - 1)) == 0;
}

// ��һ��BMP�ļ���Ϊ��������
GLuint load_texture(const char* file_name) {
    GLint width, height, total_bytes;
    GLubyte* pixels = 0;
    GLuint last_texture_ID = 0, texture_ID = 0;
    // ���ļ������ʧ�ܣ�����
    FILE* pFile;
    fopen_s(&pFile, file_name, "rb");
    if (pFile == NULL) {
        return 0;
    }


    // ��ȡ�ļ���ͼ��Ŀ�Ⱥ͸߶�
    fseek(pFile, 0x0012, SEEK_SET);
    fread(&width, 4, 1, pFile);
    fread(&height, 4, 1, pFile);
    fseek(pFile, BMP_Header_Length, SEEK_SET);

    // ����ÿ��������ռ�ֽ����������ݴ����ݼ����������ֽ���
    GLint line_bytes = width * 3;
    while (line_bytes % 4 != 0)
        ++line_bytes;
    total_bytes = line_bytes * height;

    // �����������ֽ��������ڴ�
    pixels = (GLubyte*)malloc(total_bytes);
    if (pixels == 0) {
        fclose(pFile);
        return 0;
    }

    // ��ȡ��������
    if (fread(pixels, total_bytes, 1, pFile) <= 0) {
        free(pixels);
        fclose(pFile);
        return 0;
    }

    // ����
    GLint max;
    glGetIntegerv(GL_MAX_TEXTURE_SIZE, &max);
    if (!power_of_two(width) || !power_of_two(height) || width > max || height > max) {
        const GLint new_width = 256;
        const GLint new_height = 256; // �涨���ź��µĴ�СΪ�߳���������
        GLint new_line_bytes, new_total_bytes;
        GLubyte* new_pixels = 0;
        // ����ÿ����Ҫ���ֽ��������ֽ���
        new_line_bytes = new_width * 3;
        while (new_line_bytes % 4 != 0)
            ++new_line_bytes;
        new_total_bytes = new_line_bytes * new_height;
        // �����ڴ�
        new_pixels = (GLubyte*)malloc(new_total_bytes);
        if (new_pixels == 0) {
            free(pixels);
            fclose(pFile);
            return 0;
        }
        // ������������
        gluScaleImage(GL_RGB, width, height, GL_UNSIGNED_BYTE, pixels, new_width, new_height, GL_UNSIGNED_BYTE, new_pixels);
        // �ͷ�ԭ�����������ݣ���pixelsָ���µ��������ݣ�����������width��height
        free(pixels);
        pixels = new_pixels;
        width = new_width;
        height = new_height;
    }

    // ����һ���µ�������
    glGenTextures(1, &texture_ID);
    if (texture_ID == 0) {
        free(pixels);
        fclose(pFile);
        return 0;
    }

    // ���µ������������������������
    // �ڰ�ǰ���Ȼ��ԭ���󶨵������ţ��Ա��������лָ�
    GLint lastTextureID = last_texture_ID;
    glGetIntegerv(GL_TEXTURE_BINDING_2D, &lastTextureID);
    glBindTexture(GL_TEXTURE_2D, texture_ID);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_REPEAT);
    glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_REPEAT);
    glTexEnvf(GL_TEXTURE_ENV, GL_TEXTURE_ENV_MODE, GL_REPLACE);
    glTexImage2D(GL_TEXTURE_2D, 0, GL_RGB, width, height, 0, GL_BGR_EXT, GL_UNSIGNED_BYTE, pixels);
    glBindTexture(GL_TEXTURE_2D, lastTextureID);  //�ָ�֮ǰ�������
    free(pixels);
    return texture_ID;
}


//���Ƶ���
void drawEarth() {
    int loaded = 0;
    //����󶨵�Ŀ��
    glBindTexture(GL_TEXTURE_2D, texEarth);
    if (!loaded) {
        //���������Զ�����	
        glTexGeni(GL_S, GL_TEXTURE_GEN_MODE, GL_SPHERE_MAP);
        glTexGeni(GL_T, GL_TEXTURE_GEN_MODE, GL_SPHERE_MAP);
        //����������������
        gluQuadricDrawStyle(earth, GL_FILL);
        gluQuadricNormals(earth, GLU_SMOOTH);
        gluQuadricTexture(earth, GL_TRUE);
    }
    //��������
    glPushMatrix();
    glEnable(GL_TEXTURE_2D);
    glRotatef(-90, 1, 0, 0);
    gluSphere(earth, r, 100, 100);
    glDisable(GL_TEXTURE_2D);
    glPopMatrix();
}
//����Բ��
void drawSolidTorus()
{
    // ����һ���ü�ƽ�棬������Ϊ(0, 1, 0)��ͨ��ԭ��
    GLdouble plane[] = { 1.0, 0.0, 0.0, 0.0 };
    // ���òü�ƽ��
    glEnable(GL_CLIP_PLANE0);
    // ���òü�ƽ��
    glClipPlane(GL_CLIP_PLANE0, plane);
    // ����Բ��
    glutSolidTorus(rin, rout, 8, 50);

    glPushMatrix();
    glTranslatef(0, axiPos, 0);
    glRotatef(90.0f, 1, 0, 0);
    glutSolidCone(7, 20, 200, 200);
    glPopMatrix();


    glPushMatrix();
    glTranslatef(0, -axiPos, 0);
    glRotatef(90.0f, -1, 0, 0);
    glutSolidCone(7, 20, 200, 200);
    glPopMatrix();

    // ���òü�ƽ��
    glDisable(GL_CLIP_PLANE0);
}
//����Բ׶����
void drawBase()
{
    glPushMatrix();
    glTranslatef(0.0f, basePos, 0.0f);
    glRotatef(90.0f, -1.0f, 0.0f, 0.0f);
    glutSolidCone(30, 20, 100, 200);
    glPopMatrix();
}
//���Ƴ���
void drawScene() {
    glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
    glMatrixMode(GL_MODELVIEW); 
    glLoadIdentity(); 
    glTranslatef(400, 240, -200); 
    GLUquadric* quadric = gluNewQuadric();
    gluDisk(quadric, 0.0, 500.0, 30, 4); 
    gluDeleteQuadric(quadric); 

    glPushMatrix();
    glScalef(xyz[0], xyz[1], xyz[2]);
    glRotatef(rotX / 100, 0, 1, 0);
    glRotatef(-rotY / 100, 1, 0, 0);
    glPushMatrix();
    glRotatef(incAngle, 0, 0, -1);
    //Բ��
    drawSolidTorus();
    glPushMatrix();
    glRotatef(angle, 0, 1, 0);
    //��
    drawEarth();
    glPopMatrix();
    glPopMatrix();
    //����
    drawBase();
    glPopMatrix();
    glutSwapBuffers();
}


//����������
void handleKey(unsigned char key, int x, int y) {
    switch (key) {
        //��w��Ŵ�
    case 'w':
        r += 10;
        rout += 10;
        basePos -= 10.0f;
        axiPos += 10;
        glutPostRedisplay();
        break;
        //��s����С
    case 's':
        r -= 10;
        rout -= 10;
        basePos += 10.0f;
        axiPos -= 10;
        glutPostRedisplay();
        break;
    }
}
//������껬��
void handleMotion(int x, int y)
{
    int rx = x - oldX;
    printf("%d\n", rx);
    angle += rx;
    //�ػ�
    glutPostRedisplay();
    oldX = x;
}
//���ڵ�������
void handleResize(int w, int h) {
    if (h == 0) {
        h = 1;
    }
    glViewport(0, 0, w, h);
    glMatrixMode(GL_PROJECTION);
    glLoadIdentity();
    glOrtho(0, w, 0, h, -1000, 1000);
    glMatrixMode(GL_MODELVIEW);
}



//��ת
void update(int value) {
    angle += 1.5f;
    if (angle > 360) {
        angle -= 360;
    }
    glutPostRedisplay();
    glutTimerFunc(16, update, 0);
}



int main(int argc, char** argv) {
    //��ʼ��
    glutInit(&argc, argv);
    glutInitDisplayMode(GLUT_DOUBLE | GLUT_RGBA | GLUT_DEPTH);
    glutInitWindowSize(800, 480);

    //��������
    glutCreateWindow("������");
    initRendering();

    //�����û�����
    texEarth = load_texture("earth.bmp");
    glutDisplayFunc(drawScene);
    glutKeyboardFunc(handleKey);
    glutReshapeFunc(handleResize);
    glutMotionFunc(handleMotion);

    //����Ч��
    glutTimerFunc(16, update, 0);
    glutMainLoop();
    //�˳�ʱɾ����ģ
    gluDeleteQuadric(earth);
    return 0;
}