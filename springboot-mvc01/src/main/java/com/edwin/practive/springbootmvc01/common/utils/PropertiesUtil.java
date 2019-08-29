package com.edwin.practive.springbootmvc01.common.utils;

import com.google.common.collect.Maps;
import java.util.Map;

/**
 * Created by Edwin on 2018/8/15.<br />
 */
public class PropertiesUtil {

    /**
     * 保存全局属性值
     */
    private static Map<String, String> map = Maps.newHashMap();

    /**
     * 属性文件加载对象
     */
    private static PropertiesLoader loader = new PropertiesLoader("/application.yml");

    /**
     * 获取配置
     * @param key 为各接口对应key 解析数据用
     */
    public static String getConfig(String key) {
        String value = map.get(key);
        if (value == null){
            value = loader.getProperty(key);
            map.put(key, value != null ? value : StringUtils.EMPTY);
        }
        return value;
    }

    /**
     * 获取配置
     * @param key 为各接口对应key 解析数据用
     * @param params 穿入配置文件参数 解析格式为 ${参数} 传入封装为一个Map<String,Object> 对象  其中 value 必须为包装类
     */
    public static String getConfig(String key,Map<String,Object> params) {
        String value = map.get(key);
        if (value == null){
            value = loader.getProperty(key);
            map.put(key, value != null ? value : StringUtils.EMPTY);
        }
        if (params != null){
            for (Map.Entry<String, Object> entry : params.entrySet()) {
                String replaceStr = "${"+entry.getKey()+"}";
                value = value.replace(replaceStr,entry.getValue().toString());
            }
        }
        return value;
    }
}
