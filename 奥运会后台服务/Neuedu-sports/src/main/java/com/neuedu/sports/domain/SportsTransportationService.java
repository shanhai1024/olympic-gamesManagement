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
 * 住宿与交通调度-交通服务对象 sports_transportation_service
 * 
 * @author neuedu
 * @date 2024-06-12
 */
@Schema(description = "住宿与交通调度-交通服务对象")
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("sports_transportation_service")
public class SportsTransportationService extends BaseEntity
{
    private static final long serialVersionUID = 1L;


    /** ID */
    @Schema(title = "ID")
    private Long id;

    /** 服务类型（场馆间接送） */
    @Schema(title = "服务类型（场馆间接送）")
    @Excel(name = "服务类型", readConverterExp = "场=馆间接送")
    private String serviceType;

    /** 车辆类型 */
    @Schema(title = "车辆类型")
    @Excel(name = "车辆类型")
    private String vehicleType;

    /** 容量 */
    @Schema(title = "容量")
    @Excel(name = "容量")
    private Long capacity;

    /** 调度详情（时间表） */
    @Schema(title = "调度详情（时间表）")
    @Excel(name = "调度详情", readConverterExp = "时=间表")
    private String scheduleDetails;
}
