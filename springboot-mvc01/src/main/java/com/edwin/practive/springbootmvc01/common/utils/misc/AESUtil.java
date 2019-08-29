package com.edwin.practive.springbootmvc01.common.utils.misc;

import com.edwin.practive.springbootmvc01.common.utils.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.crypto.Cipher;
import javax.crypto.KeyGenerator;
import javax.crypto.SecretKey;
import javax.crypto.spec.SecretKeySpec;
import java.security.SecureRandom;

/**
 * Created by Edwin on 2018/8/15.<br />
 *
 * AES加解密
 */
public class AESUtil {

    private static final Logger logger = LoggerFactory.getLogger(AESUtil.class);
    private static final String defaultCharset = "UTF-8";
    private static final String KEY_AES = "AES";
    private static final String KEY = "123456";

    /**
     * 加密
     *
     * @param data 需要加密的内容
     * @param key 加密密码
     * @return
     */
    public static String encrypt(String data, String key) {
        return doAES(data, key, Cipher.ENCRYPT_MODE);
    }

    /**
     * 解密
     *
     * @param data 待解密内容
     * @param key 解密密钥
     * @return
     */
    public static String decrypt(String data, String key) {
        return doAES(data, key, Cipher.DECRYPT_MODE);
    }

    /**
     * 加解密
     *
     * @param data 待处理数据
     * @param key  密钥
     * @param mode 加解密mode
     * @return
     */
    private static String doAES(String data, String key, int mode) {
        try {
            if (StringUtils.isBlank(data) || StringUtils.isBlank(key)) {
                return null;
            }
            //判断是加密还是解密
            boolean encrypt = mode == Cipher.ENCRYPT_MODE;
            byte[] content;
            //true 加密内容 false 解密内容
            if (encrypt) {
                content = data.getBytes(defaultCharset);
            } else {
                content = parseHexStr2Byte(data);
            }
            //1.构造密钥生成器，指定为AES算法,不区分大小写
            KeyGenerator kgen = KeyGenerator.getInstance(KEY_AES);
            //2.根据ecnodeRules规则初始化密钥生成器
            //生成一个128位的随机源,根据传入的字节数组
            kgen.init(128, new SecureRandom(key.getBytes()));
            //3.产生原始对称密钥
            SecretKey secretKey = kgen.generateKey();
            //4.获得原始对称密钥的字节数组
            byte[] enCodeFormat = secretKey.getEncoded();
            //5.根据字节数组生成AES密钥
            SecretKeySpec keySpec = new SecretKeySpec(enCodeFormat, KEY_AES);
            //6.根据指定算法AES自成密码器
            Cipher cipher = Cipher.getInstance(KEY_AES);// 创建密码器
            //7.初始化密码器，第一个参数为加密(Encrypt_mode)或者解密解密(Decrypt_mode)操作，第二个参数为使用的KEY
            cipher.init(mode, keySpec);// 初始化
            byte[] result = cipher.doFinal(content);
            if (encrypt) {
                //将二进制转换成16进制
                return parseByte2HexStr(result);
            } else {
                return new String(result, defaultCharset);
            }
        } catch (Exception e) {
            logger.error("AES 密文处理异常", e);
        }
        return null;
    }
    /**
     * 将二进制转换成16进制
     *
     * @param buf
     * @return
     */
    public static String parseByte2HexStr(byte buf[]) {
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < buf.length; i++) {
            String hex = Integer.toHexString(buf[i] & 0xFF);
            if (hex.length() == 1) {
                hex = '0' + hex;
            }
            sb.append(hex.toUpperCase());
        }
        return sb.toString();
    }
    /**
     * 将16进制转换为二进制
     *
     * @param hexStr
     * @return
     */
    public static byte[] parseHexStr2Byte(String hexStr) {
        if (hexStr.length() < 1) {
            return null;
        }
        byte[] result = new byte[hexStr.length() / 2];
        for (int i = 0; i < hexStr.length() / 2; i++) {
            int high = Integer.parseInt(hexStr.substring(i * 2, i * 2 + 1), 16);
            int low = Integer.parseInt(hexStr.substring(i * 2 + 1, i * 2 + 2), 16);
            result[i] = (byte) (high * 16 + low);
        }
        return result;
    }
    public static void main(String[] args) throws Exception {
        String content = "{\"success\":true,\"errorCode\":\"-1\",\"msg\":\"操作成功\",\"body\":{\"param\":{\"parent\":{\"id\":\"b43d62a66c7d40d9a5b296653e46771b\",\"remarks\":\"\",\"createBy\":{\"id\":\"1\",\"loginFlag\":\"1\",\"roleNames\":\"\",\"admin\":true},\"createDate\":\"2018-08-15 09:48:10\",\"updateBy\":{\"id\":\"1\",\"loginFlag\":\"1\",\"roleNames\":\"\",\"admin\":true},\"updateDate\":\"2018-08-15 09:48:10\",\"company\":{\"id\":\"1\",\"name\":\"总公司\",\"sort\":30,\"hasChildren\":false,\"type\":\"2\",\"parentId\":\"0\"},\"level\":{\"id\":\"a8a0e11aedb64f3aa6f6f37344530e40\",\"levelName\":\"级别3\"},\"project\":{\"id\":\"6849868fb69d45958440893a140b8677\",\"projectName\":\"001\"},\"item\":{\"id\":\"db9ac758f4a34ad0af4a4277aef6df7c\",\"itemName\":\"物料1\"},\"brand\":{\"id\":\"e4c9ac750b374fbd946c38eef849a1cf\",\"brandName\":\"品牌1\"},\"uom\":{\"id\":\"754c31cb0e6f4b99a1f5c437b3737252\",\"uomName\":\"kg\"},\"consumption\":\"111.00\",\"isUseable\":\"1\"},\"childs\":{\"cpReplaceMaterial\":[{\"id\":\"10d1881e24704e3daed0a0a6be0f145a\",\"createBy\":{\"id\":\"1\",\"loginFlag\":\"1\",\"roleNames\":\"\",\"admin\":true},\"createDate\":\"2018-08-15 09:48:10\",\"updateBy\":{\"id\":\"1\",\"loginFlag\":\"1\",\"roleNames\":\"\",\"admin\":true},\"updateDate\":\"2018-08-15 09:48:10\",\"analysis\":{\"id\":\"b43d62a66c7d40d9a5b296653e46771b\"},\"item\":{\"id\":\"72309453357242a7af531686bfbd998a\",\"itemCode\":\"2232143234312\",\"itemName\":\"324234\",\"brand\":{\"brandName\":\"品牌1\"},\"uom\":{\"uomName\":\"kg\"}},\"isUseable\":\"1\"},{\"id\":\"259eea28af9947c397a1a5a2ccbb8ca6\",\"createBy\":{\"id\":\"1\",\"loginFlag\":\"1\",\"roleNames\":\"\",\"admin\":true},\"createDate\":\"2018-08-15 09:48:10\",\"updateBy\":{\"id\":\"1\",\"loginFlag\":\"1\",\"roleNames\":\"\",\"admin\":true},\"updateDate\":\"2018-08-15 09:48:10\",\"analysis\":{\"id\":\"b43d62a66c7d40d9a5b296653e46771b\"},\"item\":{\"id\":\"ee2b98d70565492fb07677db99123c76\",\"itemCode\":\"1232132323\",\"itemName\":\"2131232342\",\"brand\":{\"brandName\":\"品牌1\"},\"uom\":{\"uomName\":\"kg\"}},\"isUseable\":\"1\"},{\"id\":\"4787e5dc43b74bcd9fef3194cea2aefc\",\"createBy\":{\"id\":\"1\",\"loginFlag\":\"1\",\"roleNames\":\"\",\"admin\":true},\"createDate\":\"2018-08-15 09:48:10\",\"updateBy\":{\"id\":\"1\",\"loginFlag\":\"1\",\"roleNames\":\"\",\"admin\":true},\"updateDate\":\"2018-08-15 09:48:10\",\"analysis\":{\"id\":\"b43d62a66c7d40d9a5b296653e46771b\"},\"item\":{\"id\":\"4d4552ad63c5447ab12c62d07b7302e1\",\"itemCode\":\"002\",\"itemName\":\"002\",\"brand\":{\"brandName\":\"品牌1\"},\"uom\":{\"uomName\":\"kg\"}},\"isUseable\":\"1\"},{\"id\":\"61c151b8e6af4b62ba0008b02d70f333\",\"createBy\":{\"id\":\"1\",\"loginFlag\":\"1\",\"roleNames\":\"\",\"admin\":true},\"createDate\":\"2018-08-15 09:48:10\",\"updateBy\":{\"id\":\"1\",\"loginFlag\":\"1\",\"roleNames\":\"\",\"admin\":true},\"updateDate\":\"2018-08-15 09:48:10\",\"analysis\":{\"id\":\"b43d62a66c7d40d9a5b296653e46771b\"},\"item\":{\"id\":\"1c9613a8e55d4d87b3505a335322f031\",\"itemCode\":\"asdasdas\",\"itemName\":\"123213\",\"brand\":{\"brandName\":\"品牌1\"},\"uom\":{\"uomName\":\"kg\"}},\"isUseable\":\"1\"},{\"id\":\"6e47cde039e1446699c8a10273664847\",\"createBy\":{\"id\":\"1\",\"loginFlag\":\"1\",\"roleNames\":\"\",\"admin\":true},\"createDate\":\"2018-08-15 09:48:10\",\"updateBy\":{\"id\":\"1\",\"loginFlag\":\"1\",\"roleNames\":\"\",\"admin\":true},\"updateDate\":\"2018-08-15 09:48:10\",\"analysis\":{\"id\":\"b43d62a66c7d40d9a5b296653e46771b\"},\"item\":{\"id\":\"7d116336989d44f0871305656a7baa13\",\"itemCode\":\"213123213\",\"itemName\":\"213213\",\"brand\":{\"brandName\":\"品牌1\"},\"uom\":{\"uomName\":\"kg\"}},\"isUseable\":\"1\"},{\"id\":\"986dcf2d6fb24dd3babe821deba66711\",\"createBy\":{\"id\":\"1\",\"loginFlag\":\"1\",\"roleNames\":\"\",\"admin\":true},\"createDate\":\"2018-08-15 09:48:10\",\"updateBy\":{\"id\":\"1\",\"loginFlag\":\"1\",\"roleNames\":\"\",\"admin\":true},\"updateDate\":\"2018-08-15 09:48:10\",\"analysis\":{\"id\":\"b43d62a66c7d40d9a5b296653e46771b\"},\"item\":{\"id\":\"6839c74ddc2a4c0eab8868dbed155f4e\",\"itemCode\":\"213213\",\"itemName\":\"123123\",\"brand\":{\"brandName\":\"品牌1\"},\"uom\":{\"uomName\":\"kg\"}},\"isUseable\":\"1\"},{\"id\":\"bb2fc71c322e4a4da5ad7dd5a2015331\",\"createBy\":{\"id\":\"1\",\"loginFlag\":\"1\",\"roleNames\":\"\",\"admin\":true},\"createDate\":\"2018-08-15 09:48:10\",\"updateBy\":{\"id\":\"1\",\"loginFlag\":\"1\",\"roleNames\":\"\",\"admin\":true},\"updateDate\":\"2018-08-15 09:48:10\",\"analysis\":{\"id\":\"b43d62a66c7d40d9a5b296653e46771b\"},\"item\":{\"id\":\"922b40152b65437481b51b468d883bd7\",\"itemCode\":\"003\",\"itemName\":\"003\",\"brand\":{\"brandName\":\"品牌1\"},\"uom\":{\"uomName\":\"kg\"}},\"isUseable\":\"1\"},{\"id\":\"bd078d14384b40e5a10eae7c9d3f3470\",\"createBy\":{\"id\":\"1\",\"loginFlag\":\"1\",\"roleNames\":\"\",\"admin\":true},\"createDate\":\"2018-08-15 09:48:10\",\"updateBy\":{\"id\":\"1\",\"loginFlag\":\"1\",\"roleNames\":\"\",\"admin\":true},\"updateDate\":\"2018-08-15 09:48:10\",\"analysis\":{\"id\":\"b43d62a66c7d40d9a5b296653e46771b\"},\"item\":{\"id\":\"8e287d7e87234a6e88dddd489fb5e959\",\"itemCode\":\"005\",\"itemName\":\"005\",\"brand\":{\"brandName\":\"品牌1\"},\"uom\":{\"uomName\":\"kg\"}},\"isUseable\":\"1\"},{\"id\":\"f432462aa1e749fd9eee32e136264c5c\",\"createBy\":{\"id\":\"1\",\"loginFlag\":\"1\",\"roleNames\":\"\",\"admin\":true},\"createDate\":\"2018-08-15 09:48:10\",\"updateBy\":{\"id\":\"1\",\"loginFlag\":\"1\",\"roleNames\":\"\",\"admin\":true},\"updateDate\":\"2018-08-15 09:48:10\",\"analysis\":{\"id\":\"b43d62a66c7d40d9a5b296653e46771b\"},\"item\":{\"id\":\"048495241c204ef795c577318b46d6d9\",\"itemCode\":\"123\",\"itemName\":\"123\",\"brand\":{\"brandName\":\"品牌1\"},\"uom\":{\"uomName\":\"kg\"}},\"isUseable\":\"1\"},{\"id\":\"fddb173578eb485799344f14c8788714\",\"createBy\":{\"id\":\"1\",\"loginFlag\":\"1\",\"roleNames\":\"\",\"admin\":true},\"createDate\":\"2018-08-15 09:48:10\",\"updateBy\":{\"id\":\"1\",\"loginFlag\":\"1\",\"roleNames\":\"\",\"admin\":true},\"updateDate\":\"2018-08-15 09:48:10\",\"analysis\":{\"id\":\"b43d62a66c7d40d9a5b296653e46771b\"},\"item\":{\"id\":\"a88d1b3ea6d14d339410230de6552f3a\",\"itemCode\":\"123213\",\"itemName\":\"123123\",\"brand\":{\"brandName\":\"品牌1\"},\"uom\":{\"uomName\":\"001\"}},\"isUseable\":\"1\"}]}}}}";
        System.out.println("加密前：" + content);
        System.out.println("加密密钥和解密密钥：" + KEY);
        String encrypt = AESUtil.encrypt(content, KEY);
        System.out.println("加密后：" + encrypt);
        String decrypt = AESUtil.decrypt(encrypt, KEY);
        System.out.println("解密后：" + decrypt);
    }

}
