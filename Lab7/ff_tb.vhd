library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity FF_TB is
end entity FF_TB;

architecture Simulation of FF_TB is
    signal CLK : std_logic := '0';
    signal S, R : std_logic := '0';
    signal D : std_logic := '0';
    signal J, K : std_logic := '0';
    signal T : std_logic := '0';
    signal Q_SR, Q_D, Q_JK, Q_T : std_logic;
    signal QB_SR, QB_D, QB_JK, QB_T : std_logic;
    
    constant CLK_PERIOD : time := 20 ns;
begin
    -- Clock generation
    CLK <= not CLK after CLK_PERIOD / 2;

    -- Component Instantiations
    U1 : entity work.SR_FF port map (CLK => CLK, S => S, R => R, Q => Q_SR, QB => QB_SR);
    U2 : entity work.D_FF  port map (CLK => CLK, D => D, Q => Q_D, QB => QB_D);
    U3 : entity work.JK_FF port map (CLK => CLK, J => J, K => K, Q => Q_JK, QB => QB_JK);
    U4 : entity work.T_FF  port map (CLK => CLK, T => T, Q => Q_T, QB => QB_T);

    STIMULUS : process
    begin
        -- SR FF test
        S <= '1'; R <= '0'; wait for 40 ns; -- Set
        S <= '0'; R <= '1'; wait for 40 ns; -- Reset
        S <= '0'; R <= '0'; wait for 40 ns; -- Hold
        
        -- D FF test
        D <= '1'; wait for 40 ns;
        D <= '0'; wait for 40 ns;

        -- JK FF test
        J <= '1'; K <= '0'; wait for 40 ns; -- Set
        J <= '1'; K <= '1'; wait for 40 ns; -- Toggle
        J <= '0'; K <= '1'; wait for 40 ns; -- Reset
        
        -- T FF test
        T <= '1'; wait for 80 ns; -- Toggle twice
        T <= '0'; wait for 40 ns; -- Hold
        
        wait;
    end process;
end architecture Simulation;