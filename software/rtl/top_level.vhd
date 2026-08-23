-- Newman Waters
library ieee;
use ieee.std_logic_1164.all;

entity top_level is
    port (
        -- Internal Clock 
        clk     : in  std_logic;
        -- Push Buttons : Active Low
        key0, key1 : in  std_logic;
        -- Slide Switches
        sw      : in  std_logic_vector(9 downto 0);
        -- LEDS : Active High
        leds    : out std_logic_vector(9 downto 0);
        -- Seven Segment Displays : Active Low
        hex0, hex1, hex2, hex3, hex4, hex5   : out std_logic_vector(6 downto 0);
        -- VGA Output
        vga_red     : out std_logic_vector(3 downto 0);
        vga_green   : out std_logic_vector(3 downto 0);
        vga_blue    : out std_logic_vector(3 downto 0);
        vga_hs      : out std_logic;
        vga_vs      : out std_logic
    );
end top_level;

architecture str of top_level is
    -- Component Declaration
    component SimpleLogic IS
	port(
        A, B, C, D	: IN 	STD_LOGIC ;
		Z: OUT STD_LOGIC
    );
    end component;
begin
    Component_Inst: SimpleLogic
        port map (
            A => sw(0),
            B => sw(1),
            C => sw(2),
            D => sw(3),
            Z => leds(0)
        );
end;