<!--Date: 2015-09-22
Title: 从web看native的MVVM（一）
Tags: MVVM
Status: public-->

#从web看native的MVVM（一）
#####背景
>随着前端技术的在开发工作中的角色越来越重要，需求量也越来越大，那么高效率的框架也应运而生，过去script方式已进化为MVC，现在我们是否应该顺应潮流推动MVC进化到MVVM呢？

#####介绍
1. web与native的组成对比
	* web : html + css + js
	* android : 四大组件(activity、service、broadcase receiver、content provider)和五大布局(LinearLayout、FrameLayout、RelativeLayout、AbsoluteLayout、TableLayout) 还有 java
	* iOS : xib/storyboard + oc
2. web常用的MVVM主流框架
	* handlebars.js、knockout.js、ember.js、avalon.js、angular.js
3. angularJS的核心功能
	* 自动化双向数据绑定、模块化/组件化、依赖注入、语义化标签等
4. angularJS的原理
	* 首先，浏览器会一直处于监听状态，一旦有事件被触发，就会被加到一个event queue中，event queue中的事件会一个一个的执行。
	* event queue中的事件如果是被$apply()包起来的话，就会进入到AngularJS的context中，假设的fn()是我们希望在AngularJS的context中执行的函数。
	* AngularJS将执行fn()函数，通常情况下，这个函数会改变应用的某些状态。
	* 然后AngularJS会进入到由两个小循环组成的digest循环中，一个循环是用来处理evalAsync队列（用来schedule一些需要在渲染视图之前处理的操作，通常通过setTimeout(0)实现，速度会比较慢，可能会出现视图抖动的问题）的，一个循环是处理watch列表（是一些表达式的集合，一旦有改变发生，那么watch函数就会被调用）的。digest循环会一直迭代知道evalAsync队列为空并且$watch列表也为空的时候，即model不再有任何变化。
	* 一旦AngularJS的$digest循环结束，整个执行就会离开AngularJS和Javascript的context，紧接着浏览器就会把数据改变后的视图重新渲染出来。
5. iOS常用的MVVM框架
	* KVO  reactiveCocoa
6. reactiveCocoa的核心功能
	* 自动化双向数据绑定、模块化/组件化(?)、依赖注入(无)、语义化标签(?)等
	* 像KVO,但它用blocks代替了重写-observeValueForKeyPath:ofObject:change:context:
	* 提供了一个单一的，统一的方法去处理异步的行为,包括delegate方法,blocks回调,target-action机制,notifications和KVO.
7. reactiveCocoa的原理
	* RACSignal发送事件流给它的subscriber。目前总共有三种类型的事件：next、error、completed。
	* RACSignal有很多方法可以来订阅不同的事件类型。每个方法都需要至少一个block，当事件发生时就会执行block中的逻辑。
	* 使用category来为很多基本UIKit控件添加signal。这样你就能给控件添加订阅了，text field的rac_textSignal就是这么来的。
8. angularJS与reactiveCocoa的对比
	* 核心功能对比
	* 实现原理对比
	* 实际运用对比
	
	




    
    
    
    
    
    
    
    