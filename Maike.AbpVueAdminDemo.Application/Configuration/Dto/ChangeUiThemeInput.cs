using System.ComponentModel.DataAnnotations;

namespace Maike.AbpVueAdminDemo.Configuration.Dto
{
    public class ChangeUiThemeInput
    {
        [Required]
        [StringLength(32)]
        public string Theme { get; set; }
    }
}
