

#import "IWPhotoView.h"
//#import "TWPhoto.h"
#import "UIImageView+WebCache.h"

@interface IWPhotoView()
@property (nonatomic, weak) UIImageView *gifView;
@end

@implementation IWPhotoView


- (void)setPhoto:(TWPhoto *)photo
{
    _photo = photo;
    // 下载图片
    [self sd_setImageWithURL:[NSURL URLWithString:@"http://img5.cache.netease.com/photo/0001/2016-07-21/900x600_BSGB6VIT00AO0001.jpg"] placeholderImage:[UIImage imageNamed:@"timeline_image_placeholder"]];
}

@end
