package com.neuedu.zyzxx.controller;

import java.util.List;

import com.neuedu.zyzxx.service.ISportsVolunteerService1;
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
import com.neuedu.zyzxx.domain.SportsVolunteer1;
import com.neuedu.common.utils.poi.ExcelUtil;
import com.neuedu.common.core.page.TableDataInfo;
import io.swagger.v3.oas.annotations.tags.Tag;
import io.swagger.v3.oas.annotations.Operation;

/**
 * 志愿者信息中心Controller
 *
 * @author ruoyi
 * @date 2024-11-12
 */
@RestController
@RequestMapping("/sports/volunteer")
@Tag(name = "【志愿者信息中心】管理")
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
public class SportsVolunteerController1 extends BaseController
{
    private final ISportsVolunteerService1 sportsVolunteerService;

    /**
     * 查询志愿者信息中心列表
     */
    @Operation(summary = "查询志愿者信息中心列表")
    @PreAuthorize("@ss.hasPermi('sports:volunteer:list')")
    @GetMapping("/list")
    public TableDataInfo list(SportsVolunteer1 sportsVolunteer)
    {
        startPage();
        List<SportsVolunteer1> list = sportsVolunteerService.selectSportsVolunteerList(sportsVolunteer);
        return getDataTable(list);
    }

    /**
     * 导出志愿者信息中心列表
     */
    @Operation(summary = "导出志愿者信息中心列表")
    @PreAuthorize("@ss.hasPermi('sports:volunteer:export')")
    @Log(title = "志愿者信息中心", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SportsVolunteer1 sportsVolunteer)
    {
        List<SportsVolunteer1> list = sportsVolunteerService.selectSportsVolunteerList(sportsVolunteer);
        ExcelUtil<SportsVolunteer1> util = new ExcelUtil<SportsVolunteer1>(SportsVolunteer1.class);
        util.exportExcel(response, list, "志愿者信息中心数据");
    }

    /**
     * 获取志愿者信息中心详细信息
     */
    @Operation(summary = "获取志愿者信息中心详细信息")
    @PreAuthorize("@ss.hasPermi('sports:volunteer:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(sportsVolunteerService.selectSportsVolunteerById(id));
    }

    /**
     * 新增志愿者信息中心
     */
    @Operation(summary = "新增志愿者信息中心")
    @PreAuthorize("@ss.hasPermi('sports:volunteer:add')")
    @Log(title = "志愿者信息中心", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SportsVolunteer1 sportsVolunteer)
    {
        return toAjax(sportsVolunteerService.insertSportsVolunteer(sportsVolunteer));
    }

    /**
     * 修改志愿者信息中心
     */
    @Operation(summary = "修改志愿者信息中心")
    @PreAuthorize("@ss.hasPermi('sports:volunteer:edit')")
    @Log(title = "志愿者信息中心", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SportsVolunteer1 sportsVolunteer)
    {
        return toAjax(sportsVolunteerService.updateSportsVolunteer(sportsVolunteer));
    }

    /**
     * 删除志愿者信息中心
     */
    @Operation(summary = "删除志愿者信息中心")
    @PreAuthorize("@ss.hasPermi('sports:volunteer:remove')")
    @Log(title = "志愿者信息中心", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable( name = "ids" ) Long[] ids)
    {
        return toAjax(sportsVolunteerService.deleteSportsVolunteerByIds(ids));
    }
}
