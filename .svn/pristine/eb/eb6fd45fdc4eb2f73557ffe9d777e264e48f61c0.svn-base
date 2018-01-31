package com.csu.crawler;

import org.apache.commons.lang3.StringUtils;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class DoiUtil {
    //通过StringUtils分割字符串寻找doi
//    public static String getDoiContent(String originalTikaText) {
//        if (originalTikaText == null) {
//            return null;
//        }
//        String str = StringUtils.substringBetween(StringUtils.lowerCase(originalTikaText), "doi:", " ");
//        if (str == null || "".equals(str)) {
//            return null;
//        } else {
//            String[] splits = {" ", "\n"};
//            for (int i = 0; i < splits.length; i++) {
//                String strs[] = StringUtils.split(str, splits[i]);
//                str = strs[0];
//            }
//            return str.trim();
//
//        }
//    }


    /**
     *  通过正则表达式寻找doi
     *  doi可能有大小写
     */
    public static String getDoiContentByRegex(String originalTikaText) {
        if (originalTikaText == null) {
            return null;
        }
        String doiStr = null;
        String regex = "\\b([dD][oO][iI])([:： \t]+)[\\w\\.\\-\\/]+\\b";
        Pattern p = Pattern.compile(regex);
        Matcher m = p.matcher(originalTikaText);
        if (m.find()) {
            System.out.println(">>>>>>>>>>>>find doi..." + m.group(0));
            //m.group(0)表示寻找到doi:xxxxxx，需要获得后面部分内容
            doiStr = StringUtils.split(m.group(0), ": \t")[1];

        }
        return doiStr;
    }

    //test
    public static void main(String[] args) {
//        String source2 = "plexes. Large-scale mass-spectrometric studies in Saccha-\n" +
//                "\n" +
//                "Published: 25 September 2008\n" +
//                "\n" +
//                "BMC Bioinformatics 2008, 9:398 doi     10.1186/1471-2105-9-398\n" +
//                "\n" +
//                "Received: 23 February 2008\n" +
//                "Accepted: 25 September 2008";
//        String source3 = null;
//        System.out.println(DoiUtil.getDoiContentByRegex(source2));
//        System.out.println(DoiUtil.getDoiContentByRegex(source3));

        String filepath = "E:\\uploadfile\\TCBB2011.pdf";
        try {
            String source = TikaUtil.getPDFOriginalText(filepath);
           // System.out.println(source);
            //System.out.println(DoiUtil.getDoiContent(source));
            System.out.println(DoiUtil.getDoiContentByRegex(source));
        } catch (Exception e) {
            e.printStackTrace();
        }


    }
}
