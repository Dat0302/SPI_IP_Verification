//***************************
// Author: Van Le
// vanleatwork@yahoo.com
// Phone: VN: 0396221156, US: 5125841843
//**************************
// Transaction class for SPI TLM
//*************************

class spi_tlm extends uvm_sequence_item;

  `uvm_object_utils(spi_tlm)

  //--------------------------
  // Fields
  //--------------------------
  rand bit        do_reset;          // Trigger reset
  rand bit        do_wait;           // Wait operation
  rand bit        wr_rd;             // 0 = write, 1 = read
  rand bit [31:0] addr;              // 32-bit address
  rand bit [31:0] wr_data;           // 32-bit write data
       bit [31:0] rd_data;           // 32-bit read data (response)

  //-------------------------
  // Constructor
  //-------------------------
  function new(string name = "spi_tlm");
    super.new(name);
  endfunction

  //------------------------
  // Copy, compare, convert2string (useful for debug)
  //-----------------------
  function void do_copy(uvm_object rhs);
    spi_tlm rhs_;
    if(!$cast(rhs_, rhs)) begin
      `uvm_fatal("COPY_ERROR", "Cast failed in spi_tlm::do_copy()");
    end
    super.do_copy(rhs);
    this.do_reset = rhs_.do_reset;
    this.do_wait  = rhs_.do_wait;
    this.wr_rd    = rhs_.wr_rd;
    this.addr     = rhs_.addr;
    this.wr_data  = rhs_.wr_data;
    this.rd_data  = rhs_.rd_data;
  endfunction

  function bit do_compare(uvm_object rhs, uvm_comparer comparer);
    spi_tlm rhs_;
    if(!$cast(rhs_, rhs)) return 0;
    return (
      (this.do_reset == rhs_.do_reset) &&
      (this.do_wait  == rhs_.do_wait) &&
      (this.wr_rd    == rhs_.wr_rd) &&
      (this.addr     == rhs_.addr) &&
      (this.wr_data  == rhs_.wr_data) &&
      (this.rd_data  == rhs_.rd_data)
    );
  endfunction

  function string convert2string();
    return $sformatf("do_reset=%0b do_wait=%0b wr_rd=%0b addr=0x%08h wr_data=0x%08h rd_data=0x%08h",
                     do_reset, do_wait, wr_rd, addr, wr_data, rd_data);
  endfunction

endclass
