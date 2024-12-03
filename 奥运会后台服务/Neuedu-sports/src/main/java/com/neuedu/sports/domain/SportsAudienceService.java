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
 * 门票与观众服务-观众服务对象 sports_audience_service
 * 
 * @author neuedu
 * @date 2024-06-12
 */
@Schema(description = "门票与观众服务-观众服务对象")
@Data
@EqualsAndHashCode(callSuper = true)
@TableName("sports_audience_service")
public class SportsAudienceService extends BaseEntity
{
    private static final long serialVersionUID = 1L;


    /** ID */
    @Schema(title = "ID")
    private Long id;

    /** 服务类型 */
    @Schema(title = "服务类型")
    @Excel(name = "服务类型")
    private String serviceType;

    /** 服务描述 */
    @Schema(title = "服务描述")
    @Excel(name = "服务描述")
    private String serviceDescription;
}
