library ieee;
use ieee.std_logic_1164.all;

entity parent is
    generic (
        AXIS_BYTES : positive := 8
    );
    port (
        aclk          : in  std_logic;
        aresetn       : in  std_logic;

        s_axis_tready : out std_logic;
        s_axis_tvalid : in  std_logic;
        s_axis_tdata  : in  std_logic_vector(8*AXIS_BYTES-1 downto 0);
        s_axis_tkeep  : in  std_logic_vector(  AXIS_BYTES-1 downto 0);
        s_axis_tlast  : in  std_logic;

        m_axis_tready : in  std_logic;
        m_axis_tvalid : out std_logic;
        m_axis_tdata  : out std_logic_vector(8*AXIS_BYTES-1 downto 0);
        m_axis_tkeep  : out std_logic_vector(  AXIS_BYTES-1 downto 0);
        m_axis_tlast  : out std_logic;

        m_axis_tuser  : out std_logic_vector(AXIS_BYTES-1 downto 0)
    );
end entity;

architecture rtl of parent is
begin
    
    child_inst : entity work.child
        generic map (
            AXIS_BYTES => AXIS_BYTES
        )
        port map (
            aclk          => aclk,
            aresetn       => aresetn,

            s_axis_tready => s_axis_tready,
            s_axis_tvalid => s_axis_tvalid,
            s_axis_tdata  => s_axis_tdata,
            s_axis_tkeep  => s_axis_tkeep,
            s_axis_tlast  => s_axis_tlast,

            m_axis_tready => m_axis_tready,
            m_axis_tvalid => m_axis_tvalid,
            m_axis_tdata  => m_axis_tdata,
            m_axis_tkeep  => m_axis_tkeep,
            m_axis_tlast  => m_axis_tlast
        );

end architecture;