public class Operation {

    int type;
    int index1;
    int index2;
    public Operation(int type,int index1,int index2){
        this.type=type;
        this.index1=index1;
        this.index2=index2;
    }

    public int getType() {
        return type;
    }

    public int getIndex1() {
        return index1;
    }

    public int getIndex2() {
        return index2;
    }
}
