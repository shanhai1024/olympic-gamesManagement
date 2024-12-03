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
 * 志愿者管理-培训管理对象 sports_volunteer_training_management
 * 
 * @author neuedu
 * @date 2024-06-12
 */
@Schema(description = "志愿者管理-培训管理对象")
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("sports_volunteer_training_management")
public class SportsVolunteerTrainingManagement extends BaseEntity
{
    private static final long serialVersionUID = 1L;


    /** ID */
    @Schema(title = "ID")
    private Long id;

    /** 在线培训材料 */
    @Schema(title = "在线培训材料")
    @Excel(name = "在线培训材料")
    private String trainingMaterial;

    /** 线下培训课程安排 */
    @Schema(title = "线下培训课程安排")
    @Excel(name = "线下培训课程安排")
    private String offlineTrainingSchedule;
}
