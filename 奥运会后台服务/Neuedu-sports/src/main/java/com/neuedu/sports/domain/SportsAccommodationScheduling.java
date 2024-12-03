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
 * 住宿与交通调度-住宿调度对象 sports_accommodation_scheduling
 * 
 * @author neuedu
 * @date 2024-06-12
 */
@Schema(description = "住宿与交通调度-住宿调度对象")
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("sports_accommodation_scheduling")
public class SportsAccommodationScheduling extends BaseEntity
{
    private static final long serialVersionUID = 1L;


    /** ID */
    @Schema(title = "ID")
    private Long id;

    /** 住宿类型 */
    @Schema(title = "住宿类型")
    @Excel(name = "住宿类型")
    private String accommodationType;

    /** 住宿详情 */
    @Schema(title = "住宿详情")
    @Excel(name = "住宿详情")
    private String accommodationDetails;

    /** 房间数量 */
    @Schema(title = "房间数量")
    @Excel(name = "房间数量")
    private Long numberOfRooms;
}
