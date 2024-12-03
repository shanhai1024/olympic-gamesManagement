package com.neuedu.sports.domain;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.neuedu.common.annotation.Excel;
import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;
import lombok.EqualsAndHashCode;
import com.neuedu.common.core.domain.BaseEntity;

import io.swagger.v3.oas.annotations.media.Schema;

/**
 * 门票与观众服务-客服支持对象 sports_customer_support
 * 
 * @author neuedu
 * @date 2024-06-12
 */
@Schema(description = "门票与观众服务-客服支持对象")
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("sports_customer_support")
public class SportsCustomerSupport extends BaseEntity
{
    private static final long serialVersionUID = 1L;


    /** ID */
    @Schema(title = "ID")
    private Long id;

    /** 客户姓名 */
    @Schema(title = "客户姓名")
    @Excel(name = "客户姓名")
    private String customerName;

    /** 联系方式 */
    @Schema(title = "联系方式")
    @Excel(name = "联系方式")
    private String contactInfo;

    /** 咨询详情 */
    @Schema(title = "咨询详情")
    @Excel(name = "咨询详情")
    private String inquiryDetails;

    /** 处理状态 */
    @Schema(title = "处理状态")
    @Excel(name = "处理状态")
    private String status;
}
