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
 * 住宿与交通调度-交通调度对象 sports_transportation_scheduling
 * 
 * @author neuedu
 * @date 2024-06-12
 */
@Schema(description = "住宿与交通调度-交通调度对象")
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("sports_transportation_scheduling")
public class SportsTransportationScheduling extends BaseEntity
{
    private static final long serialVersionUID = 1L;


    /** ID */
    @Schema(title = "ID")
    private Long id;

    /** 交通类型 */
    @Schema(title = "交通类型")
    @Excel(name = "交通类型")
    private String transportationType;

    /** 调度详情 */
    @Schema(title = "调度详情")
    @Excel(name = "调度详情")
    private String scheduleDetails;

    /** 容量 */
    @Schema(title = "容量")
    @Excel(name = "容量")
    private Long capacity;
}
