--* * * * * * * * * * * * * * * * * * * * * * * * * * * * * *  
--* * * * * * * * *  VHDL Source Code * * * * * * * * * * * *  
--* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * 
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;

entity LPM_SHIFTREG is
  generic (
    -- Width of the data[] and q ports. (Required)
    lpm_width     : natural;
    lpm_direction : string := "LEFT";
    -- Constant value that is loaded when aset is high.
    lpm_avalue    : string := "UNUSED";
    -- Constant value that is loaded on the rising edge of clock when sset is high.
    lpm_svalue    : string := "UNUSED";
    lpm_pvalue    : string := "UNUSED";
    lpm_type      : string := "L_SHIFTREG";
    lpm_hint      : string := "UNUSED"
  );
  port (
    -- Data input to the shift register.
    data : in std_logic_vector(lpm_width-1 downto 0) := (OTHERS => '0');
    -- Positive-edge-triggered clock. (Required)
    clock : in std_logic;
    -- Clock enable input
    enable : in std_logic := '1';
    -- Serial shift data input.
    shiftin : in std_logic := '1';
    -- Synchronous parallel load. High (1): load operation; low (0): shift operation.
    load : in std_logic := '0';
    -- Asynchronous clear input.
    aclr : in std_logic := '0';
    -- Asynchronous set input.
    aset : in std_logic := '0';
    -- Synchronous clear input.
    sclr : in std_logic := '0';
    -- Synchronous set input.
    sset : in std_logic := '0';
    -- Data output from the shift register.
    q : out std_logic_vector(lpm_width-1 downto 0);
    -- Serial shift data output.
    shiftout : out std_logic
  );
end LPM_SHIFTREG;

architecture LPM_SYN of LPM_SHIFTREG is
-- FUNCTION DECLARATION
function conv_STR_to_VECT (str : string) return std_logic_vector is
  -- conversion string to std_logic_vector
  variable len    : integer := str'length;
  variable ivalue : std_logic_vector(lpm_width+4 downto 0) := (others => '0');
  variable digit  : std_logic_vector(3 downto 0) := (others => '0');
  variable ten    : std_logic_vector(3 downto 0) := "1010";
begin
  if (str /= "UNUSED") then
    for i in 1 to len loop
      case str(i) is
        when '0' => digit := "0000";
        when '1' => digit := "0001";
        when '2' => digit := "0010";
        when '3' => digit := "0011";
        when '4' => digit := "0100";
        when '5' => digit := "0101";
        when '6' => digit := "0110";
        when '7' => digit := "0111";
        when '8' => digit := "1000";
        when '9' => digit := "1001";
        when others =>
            ASSERT FALSE
            REPORT "Illegal Character "&  str(i) & " in string parameter! "
            SEVERITY ERROR;
      end case;
      ivalue(lpm_width+3 downto 0) := unsigned(ivalue(lpm_width-1 downto 0)) * unsigned(ten) + unsigned(digit);
    end loop;
  end if;
  return ivalue(lpm_width-1 downto 0);
end conv_STR_to_VECT;

-- SIGNAL DECLARATION
signal i_q : std_logic_vector(lpm_width-1 downto 0) := (OTHERS => '0');
signal init           : std_logic := '0';
signal tmp_init       : std_logic := '0';
signal i_shiftout_pos : natural := lpm_width-1;

begin
-- PROCESS DECLARATION
  -- basic error checking for invalid parameters
  MSG: process
  begin
    if (lpm_width <= 0) then
      ASSERT FALSE
      REPORT "Value of lpm_width parameter must be greater than 0!"
      SEVERITY ERROR;
    end if;
    wait;
  end process MSG;

  process (tmp_init)
  begin
    if (tmp_init = '1') then
    init <= '1';
    end if;
  end process;

  process (clock, aclr, aset, init)
    variable avalue : std_logic_vector(lpm_width-1 downto 0):= conv_STR_to_VECT(lpm_avalue);
    variable svalue : std_logic_vector(lpm_width-1 downto 0):= conv_STR_to_VECT(lpm_svalue);
    variable pvalue : std_logic_vector(lpm_width-1 downto 0):= conv_STR_to_VECT(lpm_pvalue);
  begin
    -- INITIALIZE TO PVALUE --
    if (init = '0') then
      if (lpm_pvalue /= "UNUSED") then
        i_q <= pvalue;
      end if;
      if ((lpm_direction = "LEFT") or (lpm_direction = "UNUSED")) then
        i_shiftout_pos <= lpm_width-1;
      elsif (lpm_direction = "RIGHT") then
        i_shiftout_pos <= 0;
      else
        ASSERT FALSE
        REPORT "Illegal lpm_direction property value for LPM_SHIFTREG!"
        SEVERITY ERROR;
      end if;
      tmp_init <= '1';
    elsif (aclr =  '1') then
      i_q <= (OTHERS => '0');
    elsif (aset = '1') then
      if (lpm_avalue = "UNUSED") then
        i_q <= (OTHERS => '1');
      else
        i_q <= avalue;
      end if;
    elsif (rising_edge(clock)) then
      if (enable = '1') then
        if (sclr = '1') then
          i_q <= (OTHERS => '0');
        elsif (sset = '1') then
          if (lpm_svalue = "UNUSED") then
              i_q <= (OTHERS => '1');
          else
              i_q <= svalue;
          end if;
        elsif (load = '1') then
          i_q <= data;
        else
          if (lpm_width < 2) then
              i_q(0) <= shiftin;
          elsif (lpm_direction = "LEFT") then
              i_q <= (i_q(lpm_width-2 downto 0) & shiftin);
          else
              i_q <= (shiftin & i_q(lpm_width-1 downto 1));
          end if;
        end if;
      end if;
    end if;
  end process;

  q <= i_q;
  shiftout <= i_q(i_shiftout_pos);

end LPM_SYN;