package com.neuedu.sports.controller;

import java.util.List;
import lombok.RequiredArgsConstructor;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.neuedu.common.annotation.Log;
import com.neuedu.common.core.controller.BaseController;
import com.neuedu.common.core.domain.AjaxResult;
import com.neuedu.common.enums.BusinessType;
import com.neuedu.sports.domain.SportsAudienceService;
import com.neuedu.sports.service.ISportsAudienceServiceService;
import com.neuedu.common.utils.poi.ExcelUtil;
import com.neuedu.common.core.page.TableDataInfo;
import io.swagger.v3.oas.annotations.tags.Tag;
import io.swagger.v3.oas.annotations.Operation;

import javax.servlet.http.HttpServletResponse;

/**
 * 门票与观众服务-观众服务Controller
 * 
 * @author neuedu
 * @date 2024-06-12
 */
@RestController
@RequestMapping("/ticketsAndAudience/audienceService")
@Tag(name = "【门票与观众服务-观众服务】管理")
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
public class SportsAudienceServiceController extends BaseController
{
    private final ISportsAudienceServiceService sportsAudienceServiceService;

    /**
     * 查询门票与观众服务-观众服务列表
     */
    @Operation(summary = "查询门票与观众服务-观众服务列表")
    @PreAuthorize("@ss.hasPermi('ticketsAndAudience:audienceService:list')")
    @GetMapping("/list")
    public TableDataInfo list(SportsAudienceService sportsAudienceService)
    {
        startPage();
        List<SportsAudienceService> list = sportsAudienceServiceService.selectSportsAudienceServiceList(sportsAudienceService);
        return getDataTable(list);
    }

    /**
     * 导出门票与观众服务-观众服务列表
     */
    @Operation(summary = "导出门票与观众服务-观众服务列表")
    @PreAuthorize("@ss.hasPermi('ticketsAndAudience:audienceService:export')")
    @Log(title = "门票与观众服务-观众服务", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SportsAudienceService sportsAudienceService)
    {
        List<SportsAudienceService> list = sportsAudienceServiceService.selectSportsAudienceServiceList(sportsAudienceService);
        ExcelUtil<SportsAudienceService> util = new ExcelUtil<SportsAudienceService>(SportsAudienceService.class);
        util.exportExcel(response, list, "门票与观众服务-观众服务数据");
    }

    /**
     * 获取门票与观众服务-观众服务详细信息
     */
    @Operation(summary = "获取门票与观众服务-观众服务详细信息")
    @PreAuthorize("@ss.hasPermi('ticketsAndAudience:audienceService:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(sportsAudienceServiceService.selectSportsAudienceServiceById(id));
    }

    /**
     * 新增门票与观众服务-观众服务
     */
    @Operation(summary = "新增门票与观众服务-观众服务")
    @PreAuthorize("@ss.hasPermi('ticketsAndAudience:audienceService:add')")
    @Log(title = "门票与观众服务-观众服务", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SportsAudienceService sportsAudienceService)
    {
        return toAjax(sportsAudienceServiceService.insertSportsAudienceService(sportsAudienceService));
    }

    /**
     * 修改门票与观众服务-观众服务
     */
    @Operation(summary = "修改门票与观众服务-观众服务")
    @PreAuthorize("@ss.hasPermi('ticketsAndAudience:audienceService:edit')")
    @Log(title = "门票与观众服务-观众服务", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SportsAudienceService sportsAudienceService)
    {
        return toAjax(sportsAudienceServiceService.updateSportsAudienceService(sportsAudienceService));
    }

    /**
     * 删除门票与观众服务-观众服务
     */
    @Operation(summary = "删除门票与观众服务-观众服务")
    @PreAuthorize("@ss.hasPermi('ticketsAndAudience:audienceService:remove')")
    @Log(title = "门票与观众服务-观众服务", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable( name = "ids" ) Long[] ids) 
    {
        return toAjax(sportsAudienceServiceService.deleteSportsAudienceServiceByIds(ids));
    }
}
