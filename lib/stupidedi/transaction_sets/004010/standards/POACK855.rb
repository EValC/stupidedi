module Stupidedi
  module TransactionSets
    module FortyTen
      module Standards
        b = Builder
        d = Schema
        r = SegmentReqs
        s = SegmentDefs

        POACK855 = b.build("POACK", "855", "PurchaseOrderAcknowledgement",
          d::TableDef.header("1 - Header",
            s::ST.use( 10, r::Mandatory, d::RepeatCount.bounded(1)),
            s::BAK.use( 20, r::Mandatory, d::RepeatCount.bounded(1)),
            s::REF.use( 30, r::Optional,  d::RepeatCount.bounded(1)),

            d::LoopDef.build("N1", d::RepeatCount.bounded(200),
              s:: N1.use( 300, r::Optional,  d::RepeatCount.bounded(1)),
              s:: N2.use( 310, r::Optional,  d::RepeatCount.bounded(2)),
              s:: N3.use( 320, r::Optional,  d::RepeatCount.bounded(2)),
              s:: N4.use( 330, r::Optional,  d::RepeatCount.unbounded)
              )

          ), #end TableDef Header

          d::TableDef.detail("2 - Detail",
            d::LoopDef.build("PO1", d::RepeatCount.bounded(100000),
              s::PO1.use( 10, r::Mandatory, d::RepeatCount.bounded(1)),

              d::LoopDef.build("PID", d::RepeatCount.bounded(1000),
                s::PID.use( 30, r::Optional, d::RepeatCount.bounded(1000))
                )
              )  
          ), #end TableDef Detail

          d::TableDef.summary("3 - Summary",
            s:: CTT.use( 40, r::Optional, d::RepeatCount.bounded(10))
            s:: SE.use( 50, r::Mandatory, d::RepeatCount.bounded(1))
          ) #end TableDef Summary
        ) #end of build
      end
    end
  end
end
