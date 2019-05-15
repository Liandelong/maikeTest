using System.ComponentModel.DataAnnotations;

namespace Maike.AbpVueAdminDemo.Users.Dto
{
    public class ChangeUserLanguageDto
    {
        [Required]
        public string LanguageName { get; set; }
    }
}