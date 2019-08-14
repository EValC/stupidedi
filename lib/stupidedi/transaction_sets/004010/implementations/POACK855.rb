module Stupidedi
  module TransactionSets
    module FortyTen
      module Implementations
      	b = Builder
        d = Schema
        r = SegmentReqs
        e = ElementReqs
        s = SegmentDefs
        POACK855 = b.build("POACK", "855", "PurchaseOrderAcknowledgement",
        	d::TableDef.header("Heading",
        		b::Segment(10, s:: ST, "Transaction Set Header", r::Required, d::RepeatCount.bounded(1),
        			b::Element(e::Required, "Transaction Set Identifier Code", b::Values("855")),
              		b::Element(e::Required, "Transaction Set Control Number")), #End of segment10
        		b::Segment(20, s::BAK, "Beginning Segment for Purchase Order Acknowledgment", r::Required, d::RepeatCount.bounded(1),
        			b::Element(e::Required,    "Transaction Set Purpose Code"),
        			b::Element(e::Required,    "Acknowledgment Type"),
        			b::Element(e::Required,    "Purchase Order Number"),
        			b::Element(e::Situational, "Release Number"),
        			b::Element(e::Situational, "Contract Number")), #End of segment20
        		b::Segment(30, s:: REF, "Reference Identification", r::Situational, d::RepeatCount.unbounded,
              		b::Element(e::Required,    "Reference Identification Qualifier"),
              		b::Element(e::Situational, "Reference Identification")),
        		d::LoopDef.build("N1", d::RepeatCount.bounded(200),
        			b::Segment(300, s:: N1, "Name", r::Situational, d::RepeatCount.bounded(1),
        				b::Element(e::Required,    "Entity Identifier Code"),
                		b::Element(e::Situational, "Name"),
                		b::Element(e::Situational, "Identification Code Qualifier"),
                		b::Element(e::Situational, "Identification Code")),
        			b::Segment(310, s:: N2, "Address Information", r::Situational, d::RepeatCount.bounded(2),
                		b::Element(e::Situational,    "Name"),
                		b::Element(e::Situational, "Name")),
        			b::Segment(320, s:: N3, "Address Information", r::Situational, d::RepeatCount.bounded(2),
                		b::Element(e::Situational, "Address Information"),
                		b::Element(e::Situational, "Address Information")),
        			b::Segment(330, s:: N4, "Geographic Location", r::Situational, d::RepeatCount.unbounded,
                		b::Element(e::Situational, "City Name"),
                		b::Element(e::Situational, "State or Province Code"),
                		b::Element(e::Situational, "Postal Code"),
                		b::Element(e::Situational, "Country Code"))),
        		),#end TableDef HEADING

        	d::TableDef.header("Detail",
            d::LoopDef.build("PO1", d::RepeatCount.bounded(100000),
        		b::Segment(10, s::PO1, "Baseline Item Data", r::Required, d::RepeatCount.bounded(1),
        			b::Element(e::Situational, "Assigned Identification"),
              		b::Element(e::Situational, "Quantity Ordered"),
              		b::Element(e::Situational, "Unit or Basis for Measurement Code"),
              		b::Element(e::Situational, "Unit Price"),
              		b::Element(e::Situational, "Basis of Unit Price Code"),
              		b::Element(e::Situational, "Product Service ID Qualifier"),
              		b::Element(e::Situational, "Product Service ID"),
              		b::Element(e::Situational, "Product Service ID Qualifier"),
              		b::Element(e::Situational, "Product Service ID"),
              		b::Element(e::Situational, "Product Service ID Qualifier"),
              		b::Element(e::Situational, "Product Service ID"),
              		b::Element(e::Situational, "Product Service ID Qualifier"),
              		b::Element(e::Situational, "Product Service ID"),
              		b::Element(e::Situational, "Product Service ID Qualifier"),
              		b::Element(e::Situational, "Product Service ID"),
              		b::Element(e::Situational, "Product Service ID Qualifier"),
              		b::Element(e::Situational, "Product Service ID"),
              		b::Element(e::Situational, "Product Service ID Qualifier"),
              		b::Element(e::Situational, "Product Service ID"),
              		b::Element(e::Situational, "Product Service ID Qualifier"),
              		b::Element(e::Situational, "Product Service ID"),
              		b::Element(e::Situational, "Product Service ID Qualifier"),
              		b::Element(e::Situational, "Product Service ID"),
              		b::Element(e::Situational, "Product Service ID Qualifier"),
              		b::Element(e::Situational, "Product Service ID")
              		),
        		d::LoopDef.build("PID", d::RepeatCount.bounded(1000),
                b::Segment(30, s::PID, "Product/Item Description", r::Situational, d::RepeatCount.bounded(1000),
                 b::Element(e::required, "Item Description Type"),
                 b::Element(e::Situational, "Description"),
                 b::Element(e::Situational, "PID 03"),
                 b::Element(e::Situational, "PID 04"),
                 b::Element(e::Situational, "PID 05"),
                 b::Element(e::Situational, "PID 06"),
                 b::Element(e::Situational, "PID 07"))
              )#end of PID loop
        		) #end of PO1 loop
            		), #end of TableDef Detail
        	d::TableDef.header("Summary",
        		b::Segment(10, s::CTT, "Transaction Totals", r::Situational, d::RepeatCount.bounded(10),
                	b::Element(e::Situational, "Number of Line Items")
              	),
              	b::Segment(30, s:: SE, "Transaction Set Trailer", r::Required, d::RepeatCount.bounded(1),
              		b::Element(e::Required,    "Number of Included Segments"),
              		b::Element(e::Required,    "Transaction Set Control Number"))
              	)# end TableDef Summary
          ) #end builder
      end
    end
  end
end



