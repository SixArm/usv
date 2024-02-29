** DRAFT ** WORK IN PROGRESS ** REQUEST FOR COMMENTS **

Network Working Group                              Joel Parker Henderson
Request for Comments: ??                                          SixArm
Category: Informational                                         May 2022

  Common Format and MIME Type for Unicode Separated Values (USV) Files

Status of This Memo

   This memo provides information for the Internet community.  It does
   not specify an Internet standard of any kind.  Distribution of this
   memo is unlimited.

Copyright Notice

   Copyright (C) Joel Parker Henderson (2022).

Abstract

   This RFC documents the format used for Unicode-Separated Values (USV)
   files and registers the associated MIME type "text/usv".

Table of Contents

   1. Introduction .....................................................
   2. Definition of the USV Format .....................................
   3. MIME Type Registration of text/usv ...............................
   4. IANA Considerations ..............................................
   5. Security Considerations ..........................................
   6. Acknowledgments ..................................................
   7. References .......................................................
      7.1. Normative References ........................................
      7.2. Informative References ......................................

Henderson                    Informational                   [Section 1]
RFC ??         Common Format and MIME Type for CSV Files        May 2022

1.  Introduction

   The unicode separated values format (CSV) is useful for exchanging
   and converting data between various spreadsheet programs, databases,
   and streaming data services.
   
   Additionally, we propose the new media type (a.k.a. MIME type) 
   registered with IANA for USV. This RFC documents the format of 
   unicode separated values (USV) files and formally registers the
   new "text/usv" media type for USV.

2.  Definition of the USV Format

   1.  Data is comprised of optional units, records, groups, and files.
    
   2.  A USV unit is comprised of any content text, and ends with a 
       USV separator, typically U+241F Symbol for Unit Separator (US).

       For example:

       aaa␟

   3.  A USV record is comprised of zero or more units, and ends with a 
       USV separator, typically U+241E Symbol for Record Separator (RS).

       For example:

       aaa␟bbb␟␞

   4.  A USV group is comprised of zero or more records, and ends with a 
       USV separator, typically U+241D Symbol for Group Separator (GS).

       For example:

       aaa␟bbb␟␞ccc␟ddd␟␞␝

   5.  A USV file is comprised of zero or more groups, and ends with a 
       USV separator, typically U+241C Symbol for File Separator (FS).

       For example:

       aaa␟bbb␟␞ccc␟ddd␟␞␝eee␟fff␟␞ggg␟hhh␟␞␝␜

   *.  There maybe an optional header appearing as the first item and
       with the same format as normal items.  This header will contain 
       names corresponding to the fields in the data, and should contain
       the same number of fields as the rest of data. The presence or 
       absence of the header line should be indicated via the optional
       "header" parameter of this media type.  
       
       For example:

       name␟name␟␞aaa␟bbb␟␞


Henderson                    Informational                   [Section 1]
RFC ??         Common Format and MIME Type for CSV Files        May 2022

   The ABNF grammar [2] appears as follows:

   data = [header] [body] *ETB *chaff

   header = [ unit / record / group / file ] 

   body = [ units / records / groups / files ]

   Semantics:

   unit = *content

   units = unit *( US unit )

   record = *units

   records = record *( RS record )

   group = *records

   groups = group *( GS group )

   file = *groups

   files = file *( FS file )

   Details:

   content = *( '*' / escape-special / escape-typical )

   escape-special = ESC special

   escape-typical = ESC typical

   Special characters:

   US = U+241F Symbol for Unit Separator (US)

   RS = U+241E Symbol for Record Separator (RS)

   GS = U+241D Symbol for Group Separator (GS)

   FS = U+241C Symbol for File Separator (FS)

   ESC = U+241B Symbol for Escape (ESC)

   ETB = U+2417 Symbol for End of Transmission Block (ETB)

   TODO:

   * Add syntax for unicode_symbol_for_end_of_transmission.

   * Add syntax for a level that contains units, records, groups, files.


Henderson                    Informational                   [Section 2]
RFC ??         Common Format and MIME Type for CSV Files        May 2022

1.  MIME Type Registration of text/usv

   This section provides the media-type registration application.

   To: ietf-types@iana.org

   Subject: Registration of MIME media type text/usv

   MIME media type name: text

   MIME subtype name: usv

   Required parameters: none

   Optional parameters: charset, header

      Common usage of USV is UTF-8, but other character sets defined
      by IANA for the "text" tree may be used in conjunction with the
      "charset" parameter.

      The "header" parameter indicates the presence or absence of the
      header line.  Valid values are "present" or "absent".
      Implementors choosing not to use this parameter must make their
      own decisions as to whether the header line is present or absent.

   Encoding considerations:

      This media type uses LF to denote line breaks.  However, implementors
      should be aware that some implementations may not conform i.e. may
      incorrectly use other values.

   Security considerations:

      USV files contain passive text data that should not pose any
      risks.  However, it is possible in theory that malicious binary
      data may be included in order to exploit potential buffer overruns
      in the program processing USV data.  Additionally, private data
      may be shared via this format (which of course applies to any text
      data).

   Interoperability considerations:

      Implementors should "be conservative in what you do, be liberal in
      what you accept from others" (RFC 793 [8]) when processing USV data.
      
      Implementations deciding not to use the optional "header"
      parameter must make their own decision as to whether the header is
      absent or present.

   Published specification:

      https://github.com/sixarm/usv

   Applications that use this media type:

      Spreadsheet programs and various data conversion utilities

   Additional information:

      Magic number(s): none

      File extension(s): USV

      Macintosh File Type Code(s): TEXT

   Person & email address to contact for further information:

      Joel Parker Henderson <joel@joelparkerhenderson.com>

   Intended usage: COMMON

   Author/Change controller: IESG

2.  IANA Considerations

   Requesting IANA registration of the media type "text/usv" using 
   the application provided in Section 3 of this document.

3.  Security Considerations

   See discussion above in section 3.


6.  Acknowledgments

   The author would like to thank Shafranovich for authoring the CSV
   RFC, which provided guidance for this USV RFC.

   A special thank you goes to P.X.V.

7.  References

7.1.  Normative References

   [1]  Freed, N., Klensin, J., and J. Postel, "Multipurpose Internet
        Mail Extensions (MIME) Part Four: Registration Procedures", BCP
        13, RFC 2048, November 1996.

   [2]  Crocker, D. and P. Overell, "Augmented BNF for Syntax
        Specifications: ABNF", RFC 2234, November 1997.

   [3]  Freed, N. and N. Borenstein, "Multipurpose Internet Mail
        Extensions (MIME) Part Two: Media Types", RFC 2046, November
        1996.

7.2.  Informative References

   [4]  Henderson, J., "USV: Unicode Separated Values", 2022,
        <http://github.com/sixarm/usv>.

   [5]  Henderson, J., "USV Rust crate", 2024,
        <http://crates.io/crates/usv>.

Henderson                    Informational                   [Section ?]
RFC ??         Common Format and MIME Type for CSV Files        May 2022

Author's Address

   Joel Parker Henderson
   SixArm

   Email: joel@joeparkerhenderson.com
   URI:   https://joelparkerhenderson.com

Henderson                    Informational                   [Section 1]
RFC ??         Common Format and MIME Type for CSV Files        May 2022

** DRAFT ** WORK IN PROGRESS **

Full Copyright Statement

   Copyright (C) The Internet Society (2005).

   This document is subject to the rights, licenses and restrictions
   contained in BCP 78, and except as set forth therein, the authors
   retain all their rights.

   This document and the information contained herein are provided on an
   "AS IS" basis and THE CONTRIBUTOR, THE ORGANIZATION HE/SHE REPRESENTS
   OR IS SPONSORED BY (IF ANY), THE INTERNET SOCIETY AND THE INTERNET
   ENGINEERING TASK FORCE DISCLAIM ALL WARRANTIES, EXPRESS OR IMPLIED,
   INCLUDING BUT NOT LIMITED TO ANY WARRANTY THAT THE USE OF THE
   INFORMATION HEREIN WILL NOT INFRINGE ANY RIGHTS OR ANY IMPLIED
   WARRANTIES OF MERCHANTABILITY OR FITNESS FOR A PARTICULAR PURPOSE.

Intellectual Property

   The IETF takes no position regarding the validity or scope of any
   Intellectual Property Rights or other rights that might be claimed to
   pertain to the implementation or use of the technology described in
   this document or the extent to which any license under such rights
   might or might not be available; nor does it represent that it has
   made any independent effort to identify any such rights.  Information
   on the procedures with respect to rights in RFC documents can be
   found in BCP 78 and BCP 79.

   Copies of IPR disclosures made to the IETF Secretariat and any
   assurances of licenses to be made available, or the result of an
   attempt made to obtain a general license or permission for the use of
   such proprietary rights by implementers or users of this
   specification can be obtained from the IETF on-line IPR repository at
   http://www.ietf.org/ipr.

   The IETF invites any interested party to bring to its attention any
   copyrights, patents or patent applications, or other proprietary
   rights that may cover technology that may be required to implement
   this standard.  Please address the information to the IETF at ietf-
   ipr@ietf.org.

Acknowledgement

   Funding for the RFC Editor function is currently provided by the
   Internet Society.
