## you-get下载腾讯视频相关

### 一. 获取想要的网址

```html
https://www.sohu.com/a/200071706_696661
```

谷歌浏览器，右键-->显示网页源代码

搜索视频 ，在视频附近找到下面的网址

```html
https://v.qq.com/iframe/preview.html?vid=q1326susa3i&amp;width=500&amp;height=375&amp;auto=0
```

将上面网址中的vid值替换下面网址的`vid`字符

```html
https://v.qq.com/x/page/vid.html
```

 得到最终想要的网址
 
```html
https://v.qq.com/x/page/q1326susa3i.html
```
 
### 2. 利用`you-get`进行下载

- 先查看视频可下载的

```sh
you-get -i  https://v.qq.com/x/page/q1326susa3i.html
```

得到下面的结果

    Site:       QQ.com
    Title:      Mamady Keita
    Type:       MPEG-4 video (video/mp4)
    Size:       28.04 MiB (29401152 Bytes)

- 下载

```sh
cd ~/Desktop
you-get https://v.qq.com/x/page/q1326susa3i.html
```
`cd ~/Desktop` 表示进入桌面

### 3. 如果想跳过腾讯视频的广告, 主要指的是用户自己上传的视频

- 获取源视频网址

```html
https://v.qq.com/x/cover/b0528k2umtg.html
```

`b0528k2umtg` 为vid, 替换下面的网址中的vid

```html
https://v.qq.com/iframe/preview.html?vid=q1326susa3i&amp;auto=1
```

最终结果

```html
https://v.qq.com/iframe/preview.html?vid=b0528k2umtg&amp;auto=1
```