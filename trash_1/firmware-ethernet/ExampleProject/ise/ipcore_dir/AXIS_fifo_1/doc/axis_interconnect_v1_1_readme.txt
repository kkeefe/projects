
CHANGE LOG for AXI4-Stream Interconnect 1.1

Release Date:  July 25, 2012 
--------------------------------------------------------------------------------



Table of Contents

1. INTRODUCTION 
2. DEVICE SUPPORT    
3. NEW FEATURE HISTORY   
4. RESOLVED ISSUES 
5. KNOWN ISSUES & LIMITATIONS 
6. TECHNICAL SUPPORT & FEEDBACK
7. CORE RELEASE HISTORY 
8. LEGAL DISCLAIMER 

--------------------------------------------------------------------------------

1. INTRODUCTION

  This file contains the change log for all released versions of the Xilinx 
  LogiCORE IP core AXI4-Stream Interconnect.
  
  For the latest core updates, see the product page at:

   http://www.xilinx.com/products/intellectual-property/axi4-stream_interconnect.htm

  For installation instructions for this release, please go to:

    www.xilinx.com/ipcenter/coregen/ip_update_install_instructions.htm

  For system requirements, see:

    www.xilinx.com/ipcenter/coregen/ip_update_system_requirements.htm


2. DEVICE SUPPORT 

  2.1. ISE

    The following device families are supported by the core for this release:

    All Series 7 devices
    All Virtex-6 devices
    All Spartan-6 devices

  2.2. VIVADO

    The following device families are supported by the core for this release:

    All Series 7 devices


3. NEW FEATURE HISTORY

  3.1 ISE

  v1.1

    - Support for ACLKEN across clock converters and FIFO.

    - Area improvements in data width convertrs.

    - Enhanced GUI layout.

  v1.0

    - Initial Release


  3.2 Vivado

  v1.1

    - Same features as for ISE.

  v1.0

    - Initial Release


4. RESOLVED ISSUES 

  4.1 ISE

    - 2012/12/18 - Updated FIFO Generator instantiation to match the case of the verilog model.  

  4.2 Vivado

    - 2012/12/18 - Updated FIFO Generator instantiation to match the case of the verilog model.  

5. KNOWN ISSUES & LIMITATIONS 


  - None

  - For a comprehensive listing of Known Issues for this core, please see the IP 
    Release Notes Guide,  
    
    www.xilinx.com/support/documentation/ip_documentation/axis_interconnect/v1_1/pg035_axis_interconnect.pdf



6. TECHNICAL SUPPORT & FEEDBACK

   To obtain technical support, create a WebCase at www.xilinx.com/support.  
   Questions are routed to a team with expertise using this product.  
   Feedback on this IP core may also be submitted under the "Leave Feedback" 
   menu item in Vivado/PlanAhead.

   Xilinx provides technical support for use of this product when used
   according to the guidelines described in the core documentation, and
   cannot guarantee timing, functionality, or support of this product for
   designs that do not follow specified guidelines.


7. CORE RELEASE HISTORY 

Date        By            Version      Description
================================================================================
07/25/2012  Xilinx, Inc.  1.1         ISE 14.2 and Vivado 2012.2 support

04/24/2012  Xilinx, Inc.  1.0         ISE 14.1 support and Vivado 2012.1 beta 
                                      support, Initial Release
================================================================================


8. LEGAL DISCLAIMER

  (c) Copyright 2011 - 2012 Xilinx, Inc. All rights reserved.
  
  This file contains confidential and proprietary information
  of Xilinx, Inc. and is protected under U.S. and
  international copyright and other intellectual property
  laws.

  DISCLAIMER
  This disclaimer is not a license and does not grant any
  rights to the materials distributed herewith. Except as
  otherwise provided in a valid license issued to you by
  Xilinx, and to the maximum extent permitted by applicable
  law: (1) THESE MATERIALS ARE MADE AVAILABLE "AS IS" AND
  WITH ALL FAULTS, AND XILINX HEREBY DISCLAIMS ALL WARRANTIES
  AND CONDITIONS, EXPRESS, IMPLIED, OR STATUTORY, INCLUDING
  BUT NOT LIMITED TO WARRANTIES OF MERCHANTABILITY, NON-
  INFRINGEMENT, OR FITNESS FOR ANY PARTICULAR PURPOSE; and
  (2) Xilinx shall not be liable (whether in contract or tort,
  including negligence, or under any other theory of
  liability) for any loss or damage of any kind or nature
  related to, arising under or in connection with these
  materials, including for any direct, or any indirect,
  special, incidental, or consequential loss or damage
  (including loss of data, profits, goodwill, or any type of
  loss or damage suffered as a result of any action brought
  by a third party) even if such damage or loss was
  reasonably foreseeable or Xilinx had been advised of the
  possibility of the same. 

  CRITICAL APPLICATIONS
  Xilinx products are not designed or intended to be fail-
  safe, or for use in any application requiring fail-safe
  performance, such as life-support or safety devices or
  systems, Class III medical devices, nuclear facilities,
  applications related to the deployment of airbags, or any
  other applications that could lead to death, personal
  injury, or severe property or environmental damage
  (individually and collectively, "Critical 
  Applications"). Customer assumes the sole risk and 
  liability of any use of Xilinx products in Critical 
  Applications, subject only to applicable laws and 
  regulations governing limitations on product liability. 
 
  THIS COPYRIGHT NOTICE AND DISCLAIMER MUST BE RETAINED AS
  PART OF THIS FILE AT ALL TIMES.

