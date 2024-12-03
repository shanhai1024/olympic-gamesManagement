package com.neuedu.sports.controller;

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
import com.neuedu.sports.domain.SportsVolunteer;
import com.neuedu.sports.service.ISportsVolunteerService;
import com.neuedu.common.utils.poi.ExcelUtil;
import com.neuedu.common.core.page.TableDataInfo;
import io.swagger.v3.oas.annotations.tags.Tag;
import io.swagger.v3.oas.annotations.Operation;

/**
 * 志愿者信息中心Controller
 * 
 * @author neuedu
 * @date 2024-06-13
 */
@RestController
@RequestMapping("/message/volunteer")
@Tag(name = "【志愿者信息中心】管理")
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
public class SportsVolunteerController extends BaseController
{
    private final ISportsVolunteerService sportsVolunteerService;

    /**
     * 查询志愿者信息中心列表
     */
    @Operation(summary = "查询志愿者信息中心列表")
    @PreAuthorize("@ss.hasPermi('message:volunteer:list')")
    @GetMapping("/list")
    public TableDataInfo list(SportsVolunteer sportsVolunteer)
    {
        startPage();
        List<SportsVolunteer> list = sportsVolunteerService.selectSportsVolunteerList(sportsVolunteer);
        return getDataTable(list);
    }

    /**
     * 导出志愿者信息中心列表
     */
    @Operation(summary = "导出志愿者信息中心列表")
    @PreAuthorize("@ss.hasPermi('message:volunteer:export')")
    @Log(title = "志愿者信息中心", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SportsVolunteer sportsVolunteer)
    {
        List<SportsVolunteer> list = sportsVolunteerService.selectSportsVolunteerList(sportsVolunteer);
        ExcelUtil<SportsVolunteer> util = new ExcelUtil<SportsVolunteer>(SportsVolunteer.class);
        util.exportExcel(response, list, "志愿者信息中心数据");
    }

    /**
     * 获取志愿者信息中心详细信息
     */
    @Operation(summary = "获取志愿者信息中心详细信息")
    @PreAuthorize("@ss.hasPermi('message:volunteer:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(sportsVolunteerService.selectSportsVolunteerById(id));
    }

    /**
     * 新增志愿者信息中心
     */
    @Operation(summary = "新增志愿者信息中心")
    @PreAuthorize("@ss.hasPermi('message:volunteer:add')")
    @Log(title = "志愿者信息中心", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SportsVolunteer sportsVolunteer)
    {
        return toAjax(sportsVolunteerService.insertSportsVolunteer(sportsVolunteer));
    }

    /**
     * 修改志愿者信息中心
     */
    @Operation(summary = "修改志愿者信息中心")
    @PreAuthorize("@ss.hasPermi('message:volunteer:edit')")
    @Log(title = "志愿者信息中心", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SportsVolunteer sportsVolunteer)
    {
        return toAjax(sportsVolunteerService.updateSportsVolunteer(sportsVolunteer));
    }

    /**
     * 删除志愿者信息中心
     */
    @Operation(summary = "删除志愿者信息中心")
    @PreAuthorize("@ss.hasPermi('message:volunteer:remove')")
    @Log(title = "志愿者信息中心", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable( name = "ids" ) Long[] ids) 
    {
        return toAjax(sportsVolunteerService.deleteSportsVolunteerByIds(ids));
    }
}
