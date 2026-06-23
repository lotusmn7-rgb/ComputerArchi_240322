library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity COMPARATOR_TB is
end entity COMPARATOR_TB;

architecture Simulation of COMPARATOR_TB is
    -- Stimulus signals
    signal A, B       : std_logic_vector(1 downto 0) := "00";
    -- Observed outputs
    signal EQ, GT, LT : std_logic;
begin

    -- Instantiate the Design Under Test (DUT)
    DUT : entity work.COMPARATOR_2BIT
        port map ( 
            A  => A, 
            B  => B, 
            EQ => EQ, 
            GT => GT, 
            LT => LT 
        );

    -- Stimulus process
    STIMULUS : process
    begin
        -- Test Case 1: Both zero (Equal)
        A <= "00"; B <= "00"; wait for 10 ns; -- EQ = '1'
        
        -- Test Case 2: A is greater
        A <= "01"; B <= "00"; wait for 10 ns; -- GT = '1'
        
        -- Test Case 3: B is greater
        A <= "00"; B <= "01"; wait for 10 ns; -- LT = '1'
        
        -- Test Case 4: B is greater (MSB comparison)
        A <= "10"; B <= "11"; wait for 10 ns; -- LT = '1'
        
        -- Test Case 5: A is greater
        A <= "11"; B <= "10"; wait for 10 ns; -- GT = '1'
        
        -- Test Case 6: Both maximum (Equal)
        A <= "11"; B <= "11"; wait for 10 ns; -- EQ = '1'
        
        -- Suspend the process indefinitely to prevent an infinite loop
        wait;
    end process;

end architecture Simulation;