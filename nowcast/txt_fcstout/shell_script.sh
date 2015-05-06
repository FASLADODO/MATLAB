MTP="/home/ys/2014FebMT/REF"
OUTMTP=$MTP"/out"
OUTMTP2=$MTP"/txt_fcstout"
HREF="HRRR_ReflectivityComposite"
RREF="MergedReflectivityQCComposite"
 
w2scoreforecastll -i $OUTMTP/code_index2.xml -o $OUTMTP2/HRR_015.dat -T "$RREF" -F "$HREF:015Minute" -t15 -d "0 65" --verbose
w2scoreforecastll -i $OUTMTP/code_index2.xml -o $OUTMTP2/HRR_030.dat -T "$RREF" -F "$HREF:030Minute" -t30 -d "0 65" --verbose
w2scoreforecastll -i $OUTMTP/code_index2.xml -o $OUTMTP2/HRR_045.dat -T "$RREF" -F "$HREF:045Minute" -t45 -d "0 65" --verbose
w2scoreforecastll -i $OUTMTP/code_index2.xml -o $OUTMTP2/HRR_060.dat -T "$RREF" -F "$HREF:060Minute" -t60 -d "0 65" --verbose
w2scoreforecastll -i $OUTMTP/code_index2.xml -o $OUTMTP2/HRR_075.dat -T "$RREF" -F "$HREF:075Minute" -t75 -d "0 65" --verbose
