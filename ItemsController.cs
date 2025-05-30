using Microsoft.AspNetCore.Mvc;

[ApiController]
[Route("[controller]")]
public class ItemsController : ControllerBase
{
    [HttpGet]
    public IActionResult Get()
    {
        var items = new[] {
            new { name = "Cool Shirt", assetId = 12345678, thumbnail = "https://www.roblox.com/asset-thumbnail/image?assetId=12345678&width=420&height=420&format=png" },
            new { name = "Dark Pants", assetId = 87654321, thumbnail = "https://www.roblox.com/asset-thumbnail/image?assetId=87654321&width=420&height=420&format=png" }
        };
        return Ok(items);
    }
}