library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity freq_divider is
    generic (
        DIVIDE_BY : integer := 2
    );
    Port (
        clk     : in  STD_LOGIC;
        reset   : in  STD_LOGIC;
        clk_out : out STD_LOGIC
    );
end freq_divider;

architecture Behavioral of freq_divider is

    signal count  : integer := 0;
    signal toggle : STD_LOGIC := '0';

begin

    process(clk, reset)
    begin
        if reset = '1' then
            count <= 0;
            toggle <= '0';

        elsif rising_edge(clk) then

            if count = (DIVIDE_BY / 2 - 1) then
                toggle <= not toggle;
                count <= 0;
            else
                count <= count + 1;
            end if;

        end if;
    end process;

    clk_out <= toggle;

end Behavioral;
