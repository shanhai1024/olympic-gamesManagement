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
import com.neuedu.sports.domain.SportsSocialMediaInteraction;
import com.neuedu.sports.service.ISportsSocialMediaInteractionService;
import com.neuedu.common.utils.poi.ExcelUtil;
import com.neuedu.common.core.page.TableDataInfo;
import io.swagger.v3.oas.annotations.tags.Tag;
import io.swagger.v3.oas.annotations.Operation;

/**
 * 媒体与公关-社交媒体互动Controller
 * 
 * @author neuedu
 * @date 2024-06-12
 */
@RestController
@RequestMapping("/mediaAndPublic/mediaInteraction")
@Tag(name = "【媒体与公关-社交媒体互动】管理")
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
public class SportsSocialMediaInteractionController extends BaseController
{
    private final ISportsSocialMediaInteractionService sportsSocialMediaInteractionService;

    /**
     * 查询媒体与公关-社交媒体互动列表
     */
    @Operation(summary = "查询媒体与公关-社交媒体互动列表")
    @PreAuthorize("@ss.hasPermi('mediaAndPublic:mediaInteraction:list')")
    @GetMapping("/list")
    public TableDataInfo list(SportsSocialMediaInteraction sportsSocialMediaInteraction)
    {
        startPage();
        List<SportsSocialMediaInteraction> list = sportsSocialMediaInteractionService.selectSportsSocialMediaInteractionList(sportsSocialMediaInteraction);
        return getDataTable(list);
    }

    /**
     * 导出媒体与公关-社交媒体互动列表
     */
    @Operation(summary = "导出媒体与公关-社交媒体互动列表")
    @PreAuthorize("@ss.hasPermi('mediaAndPublic:mediaInteraction:export')")
    @Log(title = "媒体与公关-社交媒体互动", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SportsSocialMediaInteraction sportsSocialMediaInteraction)
    {
        List<SportsSocialMediaInteraction> list = sportsSocialMediaInteractionService.selectSportsSocialMediaInteractionList(sportsSocialMediaInteraction);
        ExcelUtil<SportsSocialMediaInteraction> util = new ExcelUtil<SportsSocialMediaInteraction>(SportsSocialMediaInteraction.class);
        util.exportExcel(response, list, "媒体与公关-社交媒体互动数据");
    }

    /**
     * 获取媒体与公关-社交媒体互动详细信息
     */
    @Operation(summary = "获取媒体与公关-社交媒体互动详细信息")
    @PreAuthorize("@ss.hasPermi('mediaAndPublic:mediaInteraction:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(sportsSocialMediaInteractionService.selectSportsSocialMediaInteractionById(id));
    }

    /**
     * 新增媒体与公关-社交媒体互动
     */
    @Operation(summary = "新增媒体与公关-社交媒体互动")
    @PreAuthorize("@ss.hasPermi('mediaAndPublic:mediaInteraction:add')")
    @Log(title = "媒体与公关-社交媒体互动", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SportsSocialMediaInteraction sportsSocialMediaInteraction)
    {
        return toAjax(sportsSocialMediaInteractionService.insertSportsSocialMediaInteraction(sportsSocialMediaInteraction));
    }

    /**
     * 修改媒体与公关-社交媒体互动
     */
    @Operation(summary = "修改媒体与公关-社交媒体互动")
    @PreAuthorize("@ss.hasPermi('mediaAndPublic:mediaInteraction:edit')")
    @Log(title = "媒体与公关-社交媒体互动", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SportsSocialMediaInteraction sportsSocialMediaInteraction)
    {
        return toAjax(sportsSocialMediaInteractionService.updateSportsSocialMediaInteraction(sportsSocialMediaInteraction));
    }

    /**
     * 删除媒体与公关-社交媒体互动
     */
    @Operation(summary = "删除媒体与公关-社交媒体互动")
    @PreAuthorize("@ss.hasPermi('mediaAndPublic:mediaInteraction:remove')")
    @Log(title = "媒体与公关-社交媒体互动", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable( name = "ids" ) Long[] ids) 
    {
        return toAjax(sportsSocialMediaInteractionService.deleteSportsSocialMediaInteractionByIds(ids));
    }
}
