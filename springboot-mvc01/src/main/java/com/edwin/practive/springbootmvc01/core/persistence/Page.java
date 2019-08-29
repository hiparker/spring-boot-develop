package com.edwin.practive.springbootmvc01.core.persistence;

import com.edwin.practive.springbootmvc01.common.utils.StringUtils;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.github.pagehelper.PageSerializable;

public class Page<T> extends PageSerializable<T>{


    private int pageNo = 1;
    private int pageSize = 10;
    // 标准查询有效， 实例： updatedate desc, name asc
    private String orderBy = "";


    public Page(){
        super();
    }

    public Page(int pageNo, int pageSize) {
        super();
        this.pageNo = pageNo;
        this.pageSize = pageSize;
    }

    public Page(int pageNo, int pageSize, String orderBy) {
        super();
        this.pageNo = pageNo;
        this.pageSize = pageSize;
    }

    public int getPageNo() {
        return pageNo;
    }

    public void setPageNo(int pageNo) {
        this.pageNo = pageNo;
    }

    public int getPageSize() {
        return pageSize;
    }

    public void setPageSize(int pageSize) {
        this.pageSize = pageSize;
    }

    public String getOrderBy() {
        return orderBy;
    }

    public void setOrderBy(String orderBy) {
        this.orderBy = orderBy;
    }


    /**
     * 分页函数
     */
    public void pageHelperNow(){
        if(!StringUtils.isEmpty(this.orderBy)){
            PageHelper.startPage(this.pageNo,this.pageSize,this.orderBy);
        }else{
            PageHelper.startPage(this.pageNo,this.pageSize);
        }
    }

    /**
     * 设置数据
     * @param pageInfo
     */
    public void instance(PageInfo<T> pageInfo) {
        super.setList(pageInfo.getList());
        super.setTotal(pageInfo.getTotal());
    }
}
