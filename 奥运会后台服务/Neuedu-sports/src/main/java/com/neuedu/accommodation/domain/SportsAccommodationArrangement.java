package com.neuedu.accommodation.domain;

import java.util.Date;
import com.fasterxml.jackson.annotation.JsonFormat;
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
 * 住宿安排对象 sports_accommodation_arrangement
 * 
 * @author ruoyi
 * @date 2024-11-12
 */
@Schema(description = "住宿安排对象")
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("sports_accommodation_arrangement")
public class SportsAccommodationArrangement extends BaseEntity
{
    private static final long serialVersionUID = 1L;


    /** 编号 */
    @Schema(title = "编号")
    @Excel(name = "编号")
    private Long id;

    /** 人员类型（运动员/工作人员/媒体代表） */
    @Schema(title = "人员类型（运动员/工作人员/媒体代表）")
    @Excel(name = "人员类型", readConverterExp = "运=动员/工作人员/媒体代表")
    private String personType;

    /** 住宿名称 */
    @Schema(title = "住宿名称")
    @Excel(name = "住宿名称")
    private String accommodationName;

    /** 住宿地址 */
    @Schema(title = "住宿地址")
    @Excel(name = "住宿地址")
    private String address;

    /** 入住时间 */
    @Schema(title = "入住时间")
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "入住时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date checkInDate;

    /** 退房时间 */
    @Schema(title = "退房时间")
    @JsonFormat(pattern = "yyyy-MM-dd")
    @Excel(name = "退房时间", width = 30, dateFormat = "yyyy-MM-dd")
    private Date checkOutDate;

    /** 房间数量 */
    @Schema(title = "房间数量")
    @Excel(name = "房间数量")
    private Long numberOfRooms;
}
