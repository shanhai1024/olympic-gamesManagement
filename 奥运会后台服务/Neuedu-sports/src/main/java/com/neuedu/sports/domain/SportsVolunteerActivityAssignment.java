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
 * 志愿者管理-活动分配对象 sports_volunteer_activity_assignment
 * 
 * @author neuedu
 * @date 2024-06-12
 */
@Schema(description = "志愿者管理-活动分配对象")
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("sports_volunteer_activity_assignment")
public class SportsVolunteerActivityAssignment extends BaseEntity
{
    private static final long serialVersionUID = 1L;


    /** ID */
    @Schema(title = "ID")
    private Long zho;

    /** 志愿者ID */
    @Schema(title = "志愿者ID")
    @Excel(name = "志愿者ID")
    private Long volunteerId;

    /** 赛事ID */
    @Schema(title = "赛事ID")
    @Excel(name = "赛事ID")
    private Long eventId;

    /** 工作分配详情 */
    @Schema(title = "工作分配详情")
    @Excel(name = "工作分配详情")
    private String assignmentDetail;
}
