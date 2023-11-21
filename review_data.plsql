-- ======================================================================================================
-- REVIEW_ID, USER_ID, DORM_ID, REVIEW_COMMENT
-- ======================================================================================================

-- R01 U04 D01 สะอาด ใกล้มหาลัย วิวสวย 
-- R02 U05 D03 ใกล้ศูนย์อาหาร แต่ไม่มีที่จอดรถ  	
-- R03 U01 D01 สะอาด ปลอดภัย สะดวกสบาย จอดรถง่าย เงียบสงบ   			 
-- R04 U01 D05 ไกลจากมหาลัยพอสมควร แต่ถ้ามีรถก็โอเค ห้องพักอยู่ในเกณฑ์ปกติ 	
-- R05 U05 D01 พนักงานใจดี ติดแม่น้ำ อากาศเย็น 							
-- R06 U05 D02 ใกล้มหาลัย แต่อยู่ลึกสุดซอย  ที่จอดมอไซน้อย  					
-- R07 U01 D02 เปลี่ยว ลึก น่ากลัว แต่ สะดวก และ ถูก 						
-- R08 U02 D03 ไม่มีที่จอดรถ ลึก แต่หาของกินง่าย 							
-- R09 U03 D04 ห้องพักสบาย แค่แพงไปหน่อย 								
-- R10 U04 D04 ห้องพักสวย สะอาด ใกล้ร้านอาหาร    						
-- R11 U05 D05 ห้องพักโอเค แต่เดินทางลำบาก 								
-- R12 U03 D06 ห้องค่อนข้างเก่า ไกลจากมหาลัย เดินทางลำบาก  				
-- R13 U02 D06 ห้องพัดลมเก่าพอสสมควร แต่เหมาะสมกับราคา 				
-- R14 U04 D07 อยู่ในบริเวณสถาบัน สามารถเดินเท้าไปได้ 					
-- R15 U02 D07 อยู่ใกล้สถานบันเทิง สามารถเดินกลับได้ ไม่อันตราย  				
-- R16 U04 D08 ห้องพักเก่า แต่ใกล้สถาบัน  								
-- R17 U01 D08 ห้องพักอยู่ในเกณฑ์ปานกลาง แต่ไม่มีที่จอดรถ 	 				
-- R18 U03 D09 ห้องพักสะอาด แต่เล็กไปหน่อย	 							
-- R19 U02 D09 ห้องพักเล็กแต่สะอาด 									
-- R20 U04 D10 ใกล้ศูนย์อาหาร แต่เก่าไปหน่อย 							
-- R21 U01 D10 หาของกินง่าย ไปไหนมาไหนสะดวก ห้องพักพอใช้ 

INSERT INTO REVIEW (REVIEW_ID, USER_ID, DORM_ID, REVIEW_COMMENT) VALUES ('R01', 'U04', 'D01', 'สะอาด ใกล้มหาลัย วิวสวย');
INSERT INTO REVIEW (REVIEW_ID, USER_ID, DORM_ID, REVIEW_COMMENT) VALUES ('R02', 'U05', 'D03', 'ใกล้ศูนย์อาหาร แต่ไม่มีที่จอดรถ');
INSERT INTO REVIEW (REVIEW_ID, USER_ID, DORM_ID, REVIEW_COMMENT) VALUES ('R03', 'U01', 'D01', 'สะอาด ปลอดภัย สะดวกสบาย จอดรถง่าย เงียบสงบ');
INSERT INTO REVIEW (REVIEW_ID, USER_ID, DORM_ID, REVIEW_COMMENT) VALUES ('R04', 'U01', 'D05', 'ไกลจากมหาลัยพอสมควร แต่ถ้ามีรถก็โอเค ห้องพักอยู่ในเกณฑ์ปกติ');
INSERT INTO REVIEW (REVIEW_ID, USER_ID, DORM_ID, REVIEW_COMMENT) VALUES ('R05', 'U05', 'D01', 'พนักงานใจดี ติดแม่น้ำ อากาศเย็น');
INSERT INTO REVIEW (REVIEW_ID, USER_ID, DORM_ID, REVIEW_COMMENT) VALUES ('R06', 'U05', 'D02', 'ใกล้มหาลัย แต่อยู่ลึกสุดซอย ที่จอดมอไซน้อย');
INSERT INTO REVIEW (REVIEW_ID, USER_ID, DORM_ID, REVIEW_COMMENT) VALUES ('R07', 'U01', 'D02', 'เปลี่ยว ลึก น่ากลัว แต่ สะดวก และ ถูก');
INSERT INTO REVIEW (REVIEW_ID, USER_ID, DORM_ID, REVIEW_COMMENT) VALUES ('R08', 'U02', 'D03', 'ไม่มีที่จอดรถ ลึก แต่หาของกินง่าย');
INSERT INTO REVIEW (REVIEW_ID, USER_ID, DORM_ID, REVIEW_COMMENT) VALUES ('R09', 'U03', 'D04', 'ห้องพักสบาย แค่แพงไปหน่อย');
INSERT INTO REVIEW (REVIEW_ID, USER_ID, DORM_ID, REVIEW_COMMENT) VALUES ('R10', 'U04', 'D04', 'ห้องพักสวย สะอาด ใกล้ร้านอาหาร');
INSERT INTO REVIEW (REVIEW_ID, USER_ID, DORM_ID, REVIEW_COMMENT) VALUES ('R11', 'U05', 'D05', 'ห้องพักโอเค แต่เดินทางลำบาก');
INSERT INTO REVIEW (REVIEW_ID, USER_ID, DORM_ID, REVIEW_COMMENT) VALUES ('R12', 'U03', 'D06', 'ห้องค่อนข้างเก่า ไกลจากมหาลัย เดินทางลำบาก');
INSERT INTO REVIEW (REVIEW_ID, USER_ID, DORM_ID, REVIEW_COMMENT) VALUES ('R13', 'U02', 'D06', 'ห้องพัดลมเก่าพอสสมควร แต่เหมาะสมกับราคา');
INSERT INTO REVIEW (REVIEW_ID, USER_ID, DORM_ID, REVIEW_COMMENT) VALUES ('R14', 'U04', 'D07', 'อยู่ในบริเวณสถาบัน สามารถเดินเท้าไปได้');
INSERT INTO REVIEW (REVIEW_ID, USER_ID, DORM_ID, REVIEW_COMMENT) VALUES ('R15', 'U02', 'D07', 'อยู่ใกล้สถานบันเทิง สามารถเดินกลับได้ ไม่อันตราย');
INSERT INTO REVIEW (REVIEW_ID, USER_ID, DORM_ID, REVIEW_COMMENT) VALUES ('R16', 'U04', 'D08', 'ห้องพักเก่า แต่ใกล้สถาบัน');
INSERT INTO REVIEW (REVIEW_ID, USER_ID, DORM_ID, REVIEW_COMMENT) VALUES ('R17', 'U01', 'D08', 'ห้องพักอยู่ในเกณฑ์ปานกลาง แต่ไม่มีที่จอดรถ');
INSERT INTO REVIEW (REVIEW_ID, USER_ID, DORM_ID, REVIEW_COMMENT) VALUES ('R18', 'U03', 'D09', 'ห้องพักสะอาด แต่เล็กไปหน่อย');
INSERT INTO REVIEW (REVIEW_ID, USER_ID, DORM_ID, REVIEW_COMMENT) VALUES ('R19', 'U02', 'D09', 'ห้องพักเล็กแต่สะอาด');
INSERT INTO REVIEW (REVIEW_ID, USER_ID, DORM_ID, REVIEW_COMMENT) VALUES ('R20', 'U04', 'D10', 'ใกล้ศูนย์อาหาร แต่เก่าไปหน่อย');
INSERT INTO REVIEW (REVIEW_ID, USER_ID, DORM_ID, REVIEW_COMMENT) VALUES ('R21', 'U01', 'D10', 'หาของกินง่าย ไปไหนมาไหนสะดวก ห้องพักพอใช้');