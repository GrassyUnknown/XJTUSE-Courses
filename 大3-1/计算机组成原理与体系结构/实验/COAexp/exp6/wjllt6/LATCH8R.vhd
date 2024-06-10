LIBRARY ieee;
   USE ieee.std_logic_1164.all; 

ENTITY latch8r IS
   PORT (
      data    : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      gate  : IN STD_LOGIC;
      rst  : IN STD_LOGIC;
      q    : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
   );
END latch8r;

ARCHITECTURE trans OF latch8r IS
BEGIN
   PROCESS (data, gate, rst)
   BEGIN
      IF (rst = '1') THEN
         q <= "00000000";
      ELSIF (gate = '1') THEN
         q <= data;
      END IF;
   END PROCESS;
   
   
END trans;