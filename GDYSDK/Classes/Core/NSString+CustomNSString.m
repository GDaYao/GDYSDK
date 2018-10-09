//
//  NSString+CustomNSString.m



#import "NSString+CustomNSString.h"

@implementation NSString (CustomNSString)

#pragma mark - ---- money code covert money tag
+ (NSString *)eachContryMoneyTagWithLangCode:(NSString *)langCode{
    
    NSString *moneyTag = langCode;
    
    // 亚洲
    if ([langCode isEqualToString:@"zh-hk"]) moneyTag = @"HK$";
    if ([langCode isEqualToString:@"en"])  moneyTag = @"$";
    if ([langCode isEqualToString:@"MOP"]) moneyTag = @"PAT";
    if ([langCode isEqualToString:@"zh-cn"]) moneyTag = @"￥";
    if ([langCode isEqualToString:@"YND"]) moneyTag = @"D";
    if ([langCode isEqualToString:@"JPY"]) moneyTag = @"J￥";
    if ([langCode isEqualToString:@"LAK"]) moneyTag = @"K";
    if ([langCode isEqualToString:@"KHR"]) moneyTag = @"CR";
    if ([langCode isEqualToString:@"PHP"]) moneyTag = @"P";
    if ([langCode isEqualToString:@"MYR"]) moneyTag = @"M$";
    if ([langCode isEqualToString:@"SGD"]) moneyTag = @"S$";
    if ([langCode isEqualToString:@"THP"]) moneyTag = @"BT$";
    if ([langCode isEqualToString:@"BUK"]) moneyTag = @"K";
    if ([langCode isEqualToString:@"LKR"]) moneyTag = @"S.Re";
    if ([langCode isEqualToString:@"MVR"]) moneyTag = @"M.R.R";
    if ([langCode isEqualToString:@"IDR"]) moneyTag = @"Rps";
    if ([langCode isEqualToString:@"PRK"]) moneyTag = @"Pak.Re";
    if ([langCode isEqualToString:@"INR"]) moneyTag = @"Re";
    if ([langCode isEqualToString:@"NPR"]) moneyTag = @"N.Re";
    if ([langCode isEqualToString:@"AFA"]) moneyTag = @"Af";
    if ([langCode isEqualToString:@"IRR"]) moneyTag = @"RI";
    if ([langCode isEqualToString:@"IQD"]) moneyTag = @"ID";
    if ([langCode isEqualToString:@"SYP"]) moneyTag = @"￡.S";
    if ([langCode isEqualToString:@"LBP"]) moneyTag = @"￡L";
    if ([langCode isEqualToString:@"JOD"]) moneyTag = @"J.D";
    if ([langCode isEqualToString:@"SAR"]) moneyTag = @"S.A.RIs";
    if ([langCode isEqualToString:@"KWD"]) moneyTag = @"K.D";
    if ([langCode isEqualToString:@"BHD"]) moneyTag = @"BD";
    if ([langCode isEqualToString:@"QAR"]) moneyTag = @"QR";
    if ([langCode isEqualToString:@"OMR"]) moneyTag = @"RO";
    if ([langCode isEqualToString:@"YER"]) moneyTag = @"YRL";
    if ([langCode isEqualToString:@"YDD"]) moneyTag = @"YD";
    if ([langCode isEqualToString:@"TRL"]) moneyTag = @"￡T";
    if ([langCode isEqualToString:@"CYP"]) moneyTag = @"￡C";
    
    // 大洋洲
    if ([langCode isEqualToString:@"AUD"]) moneyTag = @"$A";
    if ([langCode isEqualToString:@"NZD"]) moneyTag = @"$NZ";
    if ([langCode isEqualToString:@"FJD"]) moneyTag = @"F.$";
    if ([langCode isEqualToString:@"SBD"]) moneyTag = @"SL.$";
    
    // 欧洲
    if ([langCode isEqualToString:@"EUR"]) moneyTag = @"EUR";
    if ([langCode isEqualToString:@"ISK"]) moneyTag = @"I.Kr";
    if ([langCode isEqualToString:@"DKK"]) moneyTag = @"D.Kr";
    if ([langCode isEqualToString:@"NOK"]) moneyTag = @"N.Kr";
    if ([langCode isEqualToString:@"SEK"]) moneyTag = @"S.Kr";
    if ([langCode isEqualToString:@"FIM"]) moneyTag = @"FMK";
    if ([langCode isEqualToString:@"SUR"]) moneyTag = @"Rbs";
    if ([langCode isEqualToString:@"PLZ"]) moneyTag = @"ZL";
    if ([langCode isEqualToString:@"CSK"]) moneyTag = @"Kcs";
    if ([langCode isEqualToString:@"HUF"]) moneyTag = @"FT";
    if ([langCode isEqualToString:@"DEM"]) moneyTag = @"DM";
    if ([langCode isEqualToString:@"ATS"]) moneyTag = @"ScH";
    if ([langCode isEqualToString:@"CHF"]) moneyTag = @"SF";
    if ([langCode isEqualToString:@"NLG"]) moneyTag = @"Gs";
    if ([langCode isEqualToString:@"BEF"]) moneyTag = @"Bi";
    if ([langCode isEqualToString:@"LUF"]) moneyTag = @"Lux.F";
    if ([langCode isEqualToString:@"GBP"]) moneyTag = @"￡";
    if ([langCode isEqualToString:@"IEP"]) moneyTag = @"￡.Ir";
    if ([langCode isEqualToString:@"FRF"]) moneyTag = @"F.F";
    if ([langCode isEqualToString:@"ESP"]) moneyTag = @"Pts";
    if ([langCode isEqualToString:@"PTE"]) moneyTag = @"ESC";
    if ([langCode isEqualToString:@"ITL"]) moneyTag = @"Lit";
    if ([langCode isEqualToString:@"MTP"]) moneyTag = @"￡.M";
    if ([langCode isEqualToString:@"ROL"]) moneyTag = @"L";
    if ([langCode isEqualToString:@"BGL"]) moneyTag = @"Lev";
    if ([langCode isEqualToString:@"ALL"]) moneyTag = @"Af";
    if ([langCode isEqualToString:@"GRD"]) moneyTag = @"Dr";
    
    // 美洲
    if ([langCode isEqualToString:@"CAD"]) moneyTag = @"Can.$";
    if ([langCode isEqualToString:@"USD"]) moneyTag = @"U.S.$";
    if ([langCode isEqualToString:@"MXP"]) moneyTag = @"Mex.$";
    if ([langCode isEqualToString:@"GTQ"]) moneyTag = @"Q";
    if ([langCode isEqualToString:@"SVC"]) moneyTag = @"￠";
    if ([langCode isEqualToString:@"HNL"]) moneyTag = @"L";
    if ([langCode isEqualToString:@"NIC"]) moneyTag = @"CS";
    if ([langCode isEqualToString:@"CRC"]) moneyTag = @"￠";
    if ([langCode isEqualToString:@"PAB"]) moneyTag = @"B";
    if ([langCode isEqualToString:@"CUP"]) moneyTag = @"Cu.Pes";
    if ([langCode isEqualToString:@"BSD"]) moneyTag = @"B.$";
    if ([langCode isEqualToString:@"JMD"]) moneyTag = @"$.J";
    if ([langCode isEqualToString:@"HTG"]) moneyTag = @"G";
    if ([langCode isEqualToString:@"DOP"]) moneyTag = @"R.D.$";
    if ([langCode isEqualToString:@"TTD"]) moneyTag = @"T.T.$";
    if ([langCode isEqualToString:@"BBD"]) moneyTag = @"BDS.$";
    if ([langCode isEqualToString:@"COP"]) moneyTag = @"Col.$";
    if ([langCode isEqualToString:@"VEB"]) moneyTag = @"B";
    if ([langCode isEqualToString:@"GYD"]) moneyTag = @"G.$";
    if ([langCode isEqualToString:@"SRG"]) moneyTag = @"S.FI";
    if ([langCode isEqualToString:@"PES"]) moneyTag = @"S/";
    if ([langCode isEqualToString:@"ECS"]) moneyTag = @"S/";
    if ([langCode isEqualToString:@"BRC"]) moneyTag = @"Gr.$";
    if ([langCode isEqualToString:@"BOP"]) moneyTag = @"NBol.P";
    if ([langCode isEqualToString:@"CLP"]) moneyTag = @"P";
    if ([langCode isEqualToString:@"ARP"]) moneyTag = @"Arg.P";
    if ([langCode isEqualToString:@"PVG"]) moneyTag = @"Guars";
    if ([langCode isEqualToString:@"UYP"]) moneyTag = @"N.$";
    
    // 非洲
    if ([langCode isEqualToString:@"EGP"]) moneyTag = @"￡E";
    if ([langCode isEqualToString:@"LYD"]) moneyTag = @"LD";
    if ([langCode isEqualToString:@"SDP"]) moneyTag = @"￡S";
    if ([langCode isEqualToString:@"TND"]) moneyTag = @"TD";
    if ([langCode isEqualToString:@"DZD"]) moneyTag = @"AD";
    if ([langCode isEqualToString:@"MAD"]) moneyTag = @"DH";
    if ([langCode isEqualToString:@"MRO"]) moneyTag = @"UM";
    if ([langCode isEqualToString:@"XOF"]) moneyTag = @"C.F.A.F";
    if ([langCode isEqualToString:@"GMD"]) moneyTag = @"D.G";
    if ([langCode isEqualToString:@"GWP"]) moneyTag = @"PG";
    if ([langCode isEqualToString:@"GNS"]) moneyTag = @"GS";
    if ([langCode isEqualToString:@"SLL"]) moneyTag = @"Le";
    if ([langCode isEqualToString:@"LRD"]) moneyTag = @"Lib.$";
    if ([langCode isEqualToString:@"GHC"]) moneyTag = @"￠";
    if ([langCode isEqualToString:@"NGN"]) moneyTag = @"N";
    if ([langCode isEqualToString:@"XAF"]) moneyTag = @"CFAF";
    if ([langCode isEqualToString:@"GQE"]) moneyTag = @"EK";
    if ([langCode isEqualToString:@"ZAR"]) moneyTag = @"R";
    if ([langCode isEqualToString:@"DJF"]) moneyTag = @"DJ.FS";
    if ([langCode isEqualToString:@"SOS"]) moneyTag = @"Sh.So";
    if ([langCode isEqualToString:@"KES"]) moneyTag = @"K.Sh";
    if ([langCode isEqualToString:@"UGS"]) moneyTag = @"U.Sh";
    if ([langCode isEqualToString:@"TZS"]) moneyTag = @"T.Sh";
    if ([langCode isEqualToString:@"RWF"]) moneyTag = @"RF";
    if ([langCode isEqualToString:@"BIF"]) moneyTag = @"F.Bu";
    if ([langCode isEqualToString:@"ZRZ"]) moneyTag = @"Z";
    if ([langCode isEqualToString:@"ZMK"]) moneyTag = @"KW";
    if ([langCode isEqualToString:@"MCF"]) moneyTag = @"F.Mg";
    if ([langCode isEqualToString:@"SCR"]) moneyTag = @"S.RP(S)";
    if ([langCode isEqualToString:@"MUR"]) moneyTag = @"Maur.Rp";
    if ([langCode isEqualToString:@"ZWD"]) moneyTag = @"FZIM.$";
    if ([langCode isEqualToString:@"KMF"]) moneyTag = @"Com.F";
    
    
    return moneyTag;
}



@end


