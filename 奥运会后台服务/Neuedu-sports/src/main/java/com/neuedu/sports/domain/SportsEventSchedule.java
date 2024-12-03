package com.neuedu.sports.domain;

import java.time.LocalDate;
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
 * 赛事管理-赛程规划对象 sports_event_schedule
 * 
 * @author neuedu
 * @date 2024-06-12
 */
@Schema(description = "赛事管理-赛程规划对象")
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("sports_event_schedule")
public class SportsEventSchedule extends BaseEntity
{
    private static final long serialVersionUID = 1L;


    /** 主键 */
    @Schema(title = "主键")
    private Long id;

    /** 赛事名称 */
    @Schema(title = "赛事名称")
    @Excel(name = "赛事名称")
    private String eventName;

    /** 赛事日期 */
    @Schema(title = "赛事日期")
    @Excel(name = "赛事日期")
    private LocalDate eventDate;

    /** 赛事时间 */
    @Schema(title = "赛事时间")
    @Excel(name = "赛事时间")
    private LocalDate eventTime;

    /** 赛事地点 */
    @Schema(title = "赛事地点")
    @Excel(name = "赛事地点")
    private String eventLocation;
}
