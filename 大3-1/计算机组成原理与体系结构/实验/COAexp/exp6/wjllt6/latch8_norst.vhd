LIBRARY ieee;
   USE ieee.std_logic_1164.all; 

ENTITY latch8_norst IS
   PORT (
      data    : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
      gate  : IN STD_LOGIC;
      q    : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
   );
END latch8_norst;

ARCHITECTURE trans OF latch8_norst IS
BEGIN
   PROCESS (data, gate)
   BEGIN
      IF (gate = '1') THEN
         q <= data;
      END IF;
   END PROCESS;
   
   
END trans;