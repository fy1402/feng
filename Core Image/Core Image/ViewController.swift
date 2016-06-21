//
//  ViewController.swift
//  Core Image
//
//  Created by 丰雨 on 16/6/1.
//  Copyright © 2016年 Feng. All rights reserved.
//  Core Image 图片处理

//1.创建图像上下文CIContext
//
//2.创建滤镜CIFilter
//
//3.创建过滤原图片CIImage
//
//4.调用CIFilter的setValue： forKey：方法为滤镜指定源图片
//
//5.设置滤镜参数【可选】
//
//6.取得输出图片显示或保存

import UIKit

class ViewController: UIViewController {

    var imageV = UIImageView()
    var context: CIContext!  //Core Image上下文
    let image = UIImage(named: "🐦.jpg")  //原图片
    let outputImage: UIImage? = nil        //处理后的图片
    var colorControlsFilter: CIFilter!  //色彩滤镜
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
//        showAllFilters()
    }
    
    // MARK: - 打印平台支持的所有内置滤镜
    func showAllFilters() {
//        let filterNames = CIFilter.filterNamesInCategory(kCICategoryBuiltIn) as [String]
        let filterNames = CIFilter.filterNamesInCategory(kCICategoryBuiltIn)
        for filterName in filterNames {
            let filter = CIFilter(name: filterName)
            print("\rfilter:\(filter)\rattributes:\(filter?.attributes)")
        }
    }
    
    func setupUI() {
        let rightBtn:UIBarButtonItem = UIBarButtonItem(title:"渲染",style:.Plain,target:self,action:#selector(ViewController.openPhoto))
        self.navigationItem.rightBarButtonItem = rightBtn
        
        imageV.image = image
        imageV.contentMode = UIViewContentMode.ScaleAspectFit
        imageV.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)
        imageV.backgroundColor = UIColor.whiteColor()
        self.view.addSubview(imageV)
    }
    // MARK: - 将输出图片设置到UIimageView
    func setImage() {
        let outputImage = colorControlsFilter.outputImage!
        let temp = context.createCGImage(outputImage, fromRect: outputImage.extent)
        imageV.image = UIImage(CGImage: temp)
    }
    
    // MARK: - 调整饱和度
    func changeStaturation(slider: UISlider) {
        colorControlsFilter.setValue(NSNumber(float: slider.value), forKey: "inputSaturation")
        setImage()
    }
    // MARK: - 调整亮度
    func changeBrightness(slider: UISlider) {
        colorControlsFilter?.setValue(NSNumber(float: slider.value), forKey: "inputBrightness")
        setImage()
    }
    // MARK: - 调整对比度
    func changeContrast(slider: UISlider) {
        colorControlsFilter?.setValue(NSNumber(float: slider.value), forKey: "inputContrast")
        setImage()
    }
    
    func openPhoto() {
        let controlView = UIView.init(frame: CGRectMake(0, self.view.frame.size.height - 118, 375, 118))
        controlView.backgroundColor = UIColor.clearColor()
        self.view.addSubview(controlView)
        //饱和度
        let lbSaturation = UILabel.init(frame: CGRectMake(10, 10, 60, 25))
        lbSaturation.text = "Saturation"
        lbSaturation.font = UIFont.systemFontOfSize(10)
        controlView.addSubview(lbSaturation)
        let sidStaturation = UISlider.init(frame: CGRectMake(80, 10, 230, 30))
        controlView.addSubview(sidStaturation)
        sidStaturation.minimumValue = 0
        sidStaturation.maximumValue = 2
        sidStaturation.value = 1
        sidStaturation.addTarget(self, action: #selector(ViewController.changeStaturation(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        //亮度(默认为0)
        let lbBrightness = UILabel.init(frame: CGRectMake(10, 40, 60, 25))
        lbBrightness.text = "Brightness"
        lbBrightness.font = UIFont.systemFontOfSize(10)
        controlView.addSubview(lbBrightness)
        let sldBrightness = UISlider.init(frame: CGRectMake(80, 40, 230, 30))
        controlView.addSubview(sldBrightness)
        sldBrightness.minimumValue = -1
        sldBrightness.maximumValue = 1
        sldBrightness.value = 0
        sldBrightness.addTarget(self, action: #selector(ViewController.changeBrightness(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        
        //对比度(默认为1)
        let lbContrast = UILabel.init(frame: CGRectMake(10, 70, 60, 25))
        lbContrast.text = "Contrast"
        lbContrast.font = UIFont.systemFontOfSize(10)
        controlView.addSubview(lbContrast)
        let sldContrast = UISlider.init(frame: CGRectMake(80, 70, 230, 30))
        controlView.addSubview(sldContrast)
        sldContrast.minimumValue = -1
        sldContrast.maximumValue = 1
        sldContrast.value = 0
        sldContrast.addTarget(self, action: #selector(ViewController.changeContrast(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        
        //初始化CIContext
        //创建基于CPU的图像上下文
        //    NSNumber *number=[NSNumber numberWithBool:YES];
        //    NSDictionary *option=[NSDictionary dictionaryWithObject:number forKey:kCIContextUseSoftwareRenderer];
        //    _context=[CIContext contextWithOptions:option];
        context = CIContext.init(options: nil)
        //使用GPU渲染，推荐,但注意GPU的CIContext无法跨应用访问，例如直接在UIImagePickerController的完成方法中调用上下文处理就会自动降级为CPU渲染，所以推荐现在完成方法中保存图像，然后在主程序中调用
//            EAGLContext *eaglContext=[[EAGLContext alloc]initWithAPI:kEAGLRenderingAPIOpenGLES1];
        //    _context=[CIContext contextWithEAGLContext:eaglContext];//OpenGL优化过的图像上下文
        let eaglContext = EAGLContext(API: EAGLRenderingAPI.OpenGLES1)
        context = CIContext.init(EAGLContext: eaglContext)
        
        //取得滤镜
        let colorControlsFilter1 = CIFilter.init(name: "CIColorControls")
        colorControlsFilter = colorControlsFilter1
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    /**
     *  CIFilter  图像处理滤镜，每种滤镜有不同的参数设置。
     */
    func ciFilter(image: String) {
        
    }
    
    /**
     *  CIContext：图像上下文，用于管理整个图片处理过程，不同的图形上下文将利用不同的图像处理硬件进行图像处理（在iOS中可以通过不同的方式创建图像上下文，例如可以创建基于CPU的图像上下方、创建基于GPU的图像上下方以及创建OpenGL优化过的图像上下文）。
     */
    func ciContext() {
        
    }
    
    /**
     *  CIImage：Core Image框架中的图像类型，主要用于输入和输出图像。
     */
    func ciImage() {
        
    }
    
    /**
     *  高斯滤镜
     */
    func blurFilter() {
        let blurFilter = CIFilter(name: "CIGaussianBlur")
        blurFilter?.setValue(10.0, forKey: "inputRadius")
//        由于这种方法需要 AnyObject? （即 Objective-C 里的 id）作为其参数值，它不是类型安全的。因此，设置滤镜参数需要谨慎一些，确保你传值的类型是正确的。
        
    }
    
}

