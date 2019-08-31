/**
 * Copyright &copy; Edwin All rights reserved.
 */
package com.edwin.practive.springbootmvc01.core.persistence;

import java.util.Date;

import com.edwin.practive.springbootmvc01.common.utils.IdGen;
import org.apache.commons.lang3.StringUtils;
import org.hibernate.validator.constraints.Length;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;

/**
 * 数据Entity类
 * @author Edwin
 * @version 2017-05-16
 */
public abstract class DataEntity<T> extends BaseEntity<T> {

	private static final long serialVersionUID = 1L;
	
	protected String remarks;	// 备注
	protected String createBy;	// 创建者
	protected Date createDate;	// 创建日期
	protected String updateBy;	// 更新者
	protected Date updateDate;	// 更新日期
	protected String delFlag; 	// 删除标记（0：正常；1：删除；2：审核）
    protected Integer sysversion; //版本号
    protected Boolean isUseable; //是否启用

    public DataEntity() {
		super();
		this.delFlag = DEL_FLAG_NORMAL;
	}
	
	public DataEntity(String id) {
		super(id);
	}
	
	/**
	 * 插入之前执行方法，需要手动调用
	 */
	@Override
	public void preInsert(){
		if (!this.isNewRecord){
			if(this.getIdType().equals(IDTYPE_UUID)){
				setId(IdGen.uuid());
			}else if(this.getIdType().equals(IDTYPE_AUTO)){
				//使用自增长不需要设置主键
			}

		}
		if (StringUtils.isNotBlank("Edwin")){
			this.updateBy = "Edwin";
			this.createBy = "Edwin";
		}
		this.updateDate = new Date();
		this.createDate = this.updateDate;
	}

    

    /**
	 * 更新之前执行方法，需要手动调用
	 */
	@Override
	public void preUpdate(){
		if (StringUtils.isNotBlank("Edwin")){
			this.updateBy = "Edwin";
		}
		this.updateDate = new Date();
	}

	@Length(min=0, max=255)
	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	
	public String getCreateBy() {
		return createBy;
	}

	public void setCreateBy(String createBy) {
		this.createBy = createBy;
	}

	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getUpdateBy() {
		return updateBy;
	}

	public void setUpdateBy(String updateBy) {
		this.updateBy = updateBy;
	}

	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	@JsonIgnore
	@Length(min=1, max=1)
	public String getDelFlag() {
		return delFlag;
	}

	public void setDelFlag(String delFlag) {
		this.delFlag = delFlag;
	}

    public Integer getSysversion() {
        return sysversion;
    }

    public void setSysversion(Integer sysversion) {
        this.sysversion = sysversion;
    }

    public Boolean getIsUseable() {
        return isUseable;
    }

    public void setIsUseable(Boolean isUseable) {
        this.isUseable = isUseable;
    }
}
