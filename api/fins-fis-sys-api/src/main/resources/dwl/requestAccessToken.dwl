%dw 2.0 
import * from dw::core::Binaries 
output application/java 
--- 
"Basic " ++ toBase64(p('fis.consumer.key') ++ ":" ++ p('fis.consumer.secret') )