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
import com.neuedu.sports.domain.SportsNews;
import com.neuedu.sports.service.ISportsNewsService;
import com.neuedu.common.utils.poi.ExcelUtil;
import com.neuedu.common.core.page.TableDataInfo;
import io.swagger.v3.oas.annotations.tags.Tag;
import io.swagger.v3.oas.annotations.Operation;

/**
 * 新闻公告Controller
 * 
 * @author neuedu
 * @date 2024-06-13
 */
@RestController
@RequestMapping("/message/news")
@Tag(name = "【新闻公告】管理")
@RequiredArgsConstructor(onConstructor = @__(@Autowired))
public class SportsNewsController extends BaseController
{
    private final ISportsNewsService sportsNewsService;

    /**
     * 查询新闻公告列表
     */
    @Operation(summary = "查询新闻公告列表")
    @PreAuthorize("@ss.hasPermi('message:news:list')")
    @GetMapping("/list")
    public TableDataInfo list(SportsNews sportsNews)
    {
        startPage();
        List<SportsNews> list = sportsNewsService.selectSportsNewsList(sportsNews);
        return getDataTable(list);
    }

    /**
     * 导出新闻公告列表
     */
    @Operation(summary = "导出新闻公告列表")
    @PreAuthorize("@ss.hasPermi('message:news:export')")
    @Log(title = "新闻公告", businessType = BusinessType.EXPORT)
    @PostMapping("/export")
    public void export(HttpServletResponse response, SportsNews sportsNews)
    {
        List<SportsNews> list = sportsNewsService.selectSportsNewsList(sportsNews);
        ExcelUtil<SportsNews> util = new ExcelUtil<SportsNews>(SportsNews.class);
        util.exportExcel(response, list, "新闻公告数据");
    }

    /**
     * 获取新闻公告详细信息
     */
    @Operation(summary = "获取新闻公告详细信息")
    @PreAuthorize("@ss.hasPermi('message:news:query')")
    @GetMapping(value = "/{id}")
    public AjaxResult getInfo(@PathVariable("id") Long id)
    {
        return success(sportsNewsService.selectSportsNewsById(id));
    }

    /**
     * 新增新闻公告
     */
    @Operation(summary = "新增新闻公告")
    @PreAuthorize("@ss.hasPermi('message:news:add')")
    @Log(title = "新闻公告", businessType = BusinessType.INSERT)
    @PostMapping
    public AjaxResult add(@RequestBody SportsNews sportsNews)
    {
        return toAjax(sportsNewsService.insertSportsNews(sportsNews));
    }

    /**
     * 修改新闻公告
     */
    @Operation(summary = "修改新闻公告")
    @PreAuthorize("@ss.hasPermi('message:news:edit')")
    @Log(title = "新闻公告", businessType = BusinessType.UPDATE)
    @PutMapping
    public AjaxResult edit(@RequestBody SportsNews sportsNews)
    {
        return toAjax(sportsNewsService.updateSportsNews(sportsNews));
    }

    /**
     * 删除新闻公告
     */
    @Operation(summary = "删除新闻公告")
    @PreAuthorize("@ss.hasPermi('message:news:remove')")
    @Log(title = "新闻公告", businessType = BusinessType.DELETE)
	@DeleteMapping("/{ids}")
    public AjaxResult remove(@PathVariable( name = "ids" ) Long[] ids) 
    {
        return toAjax(sportsNewsService.deleteSportsNewsByIds(ids));
    }
}
