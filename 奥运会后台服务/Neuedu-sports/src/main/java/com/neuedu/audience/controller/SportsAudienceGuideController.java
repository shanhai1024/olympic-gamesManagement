package com.neuedu.audience.controller;

import java.util.List;
import lombok.RequiredArgsConstructor;
import javax.servlet.http.HttpServletResponse;
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
import com.neuedu.audience.domain.SportsAudienceGuide;
import com.neuedu.audience.service.ISportsAudienceGuideService;
import com.neuedu.common.utils.poi.ExcelUtil;
import com.neuedu.common.core.page.TableDataInfo;
import io.swagger.v3.oas.annotations.tags.Tag;
import io.swagger.v3.oas.annotations.Operation;

/**
 * 观众指南Controller
 * 
 * @author ruoyi
 * @date 2024-11-12
 */
@RestController
@RequestMapping("/audience/guide")
@Tag(name = "【观众指南】管理")
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
public class SportsAudienceGuideController extends BaseController
{
    private final ISportsAudienceGuideService sportsAudienceGuideService;

    /**
     * 查询观众指南列表
     */
    @Operation(summary = "查询观众指南列表")
    @PreAuthorize("@ss.hasPermi('audience:guide:list')")
    @GetMapping("/list")
    public TableDataInfo list(SportsAudienceGuide sportsAudienceGuide)
    {
        startPage();
        List<SportsAudienceGuide> list = sportsAudienceGuideService.selectSportsAudienceGuideList(sportsAudienceGuide);
        return getDataTable(list);
    }

    /**
     * 导出观众指南列表
     */
    @Operation(summary = "导出观众指南列表")
    @PreAuthorize("@ss.hasPermi('audience:guide:export')")
    @Log(title = "观众指南", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SportsAudienceGuide sportsAudienceGuide)
    {
        List<SportsAudienceGuide> list = sportsAudienceGuideService.selectSportsAudienceGuideList(sportsAudienceGuide);
        ExcelUtil<SportsAudienceGuide> util = new ExcelUtil<SportsAudienceGuide>(SportsAudienceGuide.class);
        util.exportExcel(response, list, "观众指南数据");
    }

    /**
     * 获取观众指南详细信息
     */
    @Operation(summary = "获取观众指南详细信息")
    @PreAuthorize("@ss.hasPermi('audience:guide:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(sportsAudienceGuideService.selectSportsAudienceGuideById(id));
    }

    /**
     * 新增观众指南
     */
    @Operation(summary = "新增观众指南")
    @PreAuthorize("@ss.hasPermi('audience:guide:add')")
    @Log(title = "观众指南", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SportsAudienceGuide sportsAudienceGuide)
    {
        return toAjax(sportsAudienceGuideService.insertSportsAudienceGuide(sportsAudienceGuide));
    }

    /**
     * 修改观众指南
     */
    @Operation(summary = "修改观众指南")
    @PreAuthorize("@ss.hasPermi('audience:guide:edit')")
    @Log(title = "观众指南", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SportsAudienceGuide sportsAudienceGuide)
    {
        return toAjax(sportsAudienceGuideService.updateSportsAudienceGuide(sportsAudienceGuide));
    }

    /**
     * 删除观众指南
     */
    @Operation(summary = "删除观众指南")
    @PreAuthorize("@ss.hasPermi('audience:guide:remove')")
    @Log(title = "观众指南", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable( name = "ids" ) Long[] ids) 
    {
        return toAjax(sportsAudienceGuideService.deleteSportsAudienceGuideByIds(ids));
    }
}
