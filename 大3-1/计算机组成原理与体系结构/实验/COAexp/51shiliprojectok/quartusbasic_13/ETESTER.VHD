LIBRARY IEEE;  -- 2005-8-28
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
ENTITY etester IS
    PORT (BCLK : IN STD_LOGIC; 
          TCLK : IN STD_LOGIC; 
           CLR : IN STD_LOGIC; 
            CL : IN STD_LOGIC; 
          SPUL : IN STD_LOGIC; 
         START : OUT STD_LOGIC; 
          EEND : OUT STD_LOGIC; 
           SEL : IN STD_LOGIC_VECTOR(2 DOWNTO 0); 
           RST : IN STD_LOGIC;
          DATA : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)           );     
END etester;
ARCHITECTURE behav OF etester IS
    SIGNAL BZQ  : STD_LOGIC_VECTOR(31 DOWNTO 0);  --标准计数器
    SIGNAL TSQ  : STD_LOGIC_VECTOR(31 DOWNTO 0);  --测频计数器
    SIGNAL ENA  : STD_LOGIC;   -- 计数使能
     
    SIGNAL  MA  : STD_LOGIC;  
    SIGNAL CLK1 : STD_LOGIC;
    SIGNAL CLK2 : STD_LOGIC;
    SIGNAL CLK3 : STD_LOGIC;
    SIGNAL   Q1 : STD_LOGIC;
    SIGNAL   Q2 : STD_LOGIC;
    SIGNAL   Q3 : STD_LOGIC;
    SIGNAL BENA : STD_LOGIC;
    SIGNAL  PUL : STD_LOGIC;  --脉宽计数使能

    SIGNAL   SS : STD_LOGIC_VECTOR(1 DOWNTO 0);

  BEGIN
    START <= ENA ;

    DATA <= BZQ(7  DOWNTO  0)  WHEN SEL = "000"  ELSE  -- 标准频率计数低8位输出
            BZQ(15 DOWNTO  8)  WHEN SEL = "001"  ELSE
            BZQ(23 DOWNTO 16)  WHEN SEL = "010"  ELSE
            BZQ(31 DOWNTO 24)  WHEN SEL = "011"  ELSE  -- 标准频率计数最高8位输出
  
            TSQ(7 DOWNTO   0)  WHEN SEL = "100"  ELSE  --待测频率计数值最低8位输出
            TSQ(15 DOWNTO  8)  WHEN SEL = "101"  ELSE
            TSQ(23 DOWNTO 16)  WHEN SEL = "110"  ELSE
            TSQ(31 DOWNTO 24)  WHEN SEL = "111"  ELSE  --待测频率计数值最高8位输出
            TSQ(31 DOWNTO 24)  ;
      
-- HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH

 BZH :  PROCESS(BCLK, CLR)                    --标准频率测试计数器，标准计数器
      BEGIN
        IF CLR = '1' THEN   BZQ <= ( OTHERS=>'0' ) ;
        ELSIF BCLK'EVENT AND BCLK = '1' THEN
            IF BENA = '1' THEN   BZQ <= BZQ + 1;   
            END IF;
        END IF;
    END PROCESS;

-- gggggggggggggggggggggggggggggggggggggggggggggggggggg

 TF : PROCESS(TCLK, CLR, ENA)                      --待测频率计数器，测频计数器
     BEGIN
       IF CLR = '1' THEN   TSQ <= ( OTHERS=>'0' );
       ELSIF TCLK'EVENT AND TCLK = '1' THEN
           IF ENA = '1' THEN   TSQ <= TSQ + 1;   
           END IF;
       END IF;
   END PROCESS;

--FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF

 PROCESS(TCLK,CLR)   --计数控制使能触发器，CL为预置门控信号，同时兼作正负脉宽测试控制信号
      BEGIN
       IF CLR = '1' THEN   ENA <= '0' ;
        ELSIF TCLK'EVENT AND TCLK = '1' THEN
               ENA <= CL ;   
       END IF;
    END PROCESS;

--OOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO
  MA  <= (TCLK AND CL) OR NOT(TCLK OR CL)  ; --测脉宽逻辑
 CLK1 <= NOT MA ; 
 CLK2 <= MA AND Q1 ;
 CLK3 <= NOT CLK2  ;
   SS <= Q2 & Q3 ;
-- HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH
 DD1:  PROCESS(CLK1,CLR)   
         BEGIN
           IF CLR = '1' THEN   Q1 <= '0' ;
             ELSIF CLK1'EVENT AND CLK1 = '1' THEN  Q1 <= '1' ;   
           END IF;
       END PROCESS;

DD2:  PROCESS(CLK2,CLR)   
         BEGIN
           IF CLR = '1' THEN   Q2 <= '0' ;
             ELSIF CLK2'EVENT AND CLK2 = '1' THEN  Q2 <= '1' ;   
           END IF;
      END PROCESS;

DD3:  PROCESS(CLK3,CLR)   
         BEGIN
           IF CLR = '1' THEN   Q3 <= '0' ;
             ELSIF CLK3'EVENT AND CLK3 = '1' THEN  Q3 <= '1' ;   
           END IF;
      END PROCESS;
-- HHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHHH
GT :
    PUL <= '1' WHEN SS = "10" ELSE  --当SS=“10”时，PUL高电平，允许标准计数器计数，
           '0' ;                    --禁止计数

   EEND <= '1' WHEN SS = "11" ELSE  --EEND为低电平时，表示正在计数，由低电平变到高电平
           '0' ;                    --时，表示计数结束，可以从标准计数器中读数据了
--UUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUU
  BENA <= ENA WHEN SPUL = '1' ELSE  --标准计数器时钟使能控制信号，当SPUL为1时，测频率
          PUL WHEN SPUL = '0' ELSE  --当SPUL为0时，测脉宽和占空比
          PUL ;
--UUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUU
END behav;

