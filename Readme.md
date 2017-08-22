# 背景
美图秀秀从5.0.0-6.9.1的fabric上有大量如下崩溃，遂进行排查

~~~
Incident Identifier: FFE8AEBE-4FDE-43F9-B216-358D0E3EF16D
CrashReporter Key:   dd5efd5ecdb0fa1956fb692525731231db46d661
Hardware Model:      iPhone4,1
Process:             UINavigationControllerPushBug [265]
Path:                /private/var/mobile/Containers/Bundle/Application/B32DA1B7-F0D8-41D5-96E7-C0EECF7BBCA7/UINavigationControllerPushBug.app/UINavigationControllerPushBug
Identifier:          com.su.UINavigationControllerPushBug
Version:             1 (1.0)
Code Type:           ARM (Native)
Parent Process:      launchd [1]

Date/Time:           2017-08-29 18:38:24.300 +0800
Launch Time:         2017-08-29 18:38:19.197 +0800
OS Version:          iOS 8.0.2 (12A405)
Report Version:      105

Exception Type:  EXC_CRASH (SIGABRT)
Exception Codes: 0x0000000000000000, 0x0000000000000000
Triggered by Thread:  0

Last Exception Backtrace:
0   CoreFoundation                	0x2ad38f82 __exceptionPreprocess + 122
1   libobjc.A.dylib               	0x38497c72 objc_exception_throw + 34
2   CoreFoundation                	0x2ad38ec8 +[NSException raise:format:] + 108
3   UIKit                         	0x2e1bdbde -[UIView(Internal) _addSubview:positioned:relativeTo:] + 110
4   UIKit                         	0x2e1bdb62 -[UIView(Hierarchy) addSubview:] + 26
5   UIKit                         	0x2e38313c __53-[_UINavigationParallaxTransition animateTransition:]_block_invoke + 1232
6   UIKit                         	0x2e1c422c +[UIView(Animation) performWithoutAnimation:] + 68
7   UIKit                         	0x2e382a24 -[_UINavigationParallaxTransition animateTransition:] + 804
8   UIKit                         	0x2e341412 -[UINavigationController _startCustomTransition:] + 2850
9   UIKit                         	0x2e26065a -[UINavigationController _startDeferredTransitionIfNeeded:] + 418
10  UIKit                         	0x2e26045c -[UINavigationController __viewWillLayoutSubviews] + 40
11  UIKit                         	0x2e2603f4 -[UILayoutContainerView layoutSubviews] + 180
12  UIKit                         	0x2e1b4d8a -[UIView(CALayerDelegate) layoutSublayersOfLayer:] + 510
13  QuartzCore                    	0x2dbdf1d0 -[CALayer layoutSublayers] + 132
14  QuartzCore                    	0x2dbdabcc CA::Layer::layout_if_needed(CA::Transaction*) + 356
15  QuartzCore                    	0x2dbdaa54 CA::Layer::layout_and_display_if_needed(CA::Transaction*) + 12
16  QuartzCore                    	0x2dbda442 CA::Context::commit_transaction(CA::Transaction*) + 218
17  QuartzCore                    	0x2dbda24c CA::Transaction::commit() + 320
18  UIKit                         	0x2e1b675c _UIApplicationHandleEventQueue + 1380
19  CoreFoundation                	0x2acff802 __CFRUNLOOP_IS_CALLING_OUT_TO_A_SOURCE0_PERFORM_FUNCTION__ + 10
20  CoreFoundation                	0x2acfec16 __CFRunLoopDoSources0 + 218
21  CoreFoundation                	0x2acfd294 __CFRunLoopRun + 764
22  CoreFoundation                	0x2ac4adac CFRunLoopRunSpecific + 472
23  CoreFoundation                	0x2ac4abbe CFRunLoopRunInMode + 102
24  GraphicsServices              	0x31fd604c GSEventRunModal + 132
25  UIKit                         	0x2e216a2c UIApplicationMain + 1436
26  UINavigationControllerPushBug 	0x000b9556 main (main.m:14)
27  libdyld.dylib                 	0x38a33aaa tlv_initializer + 2


Thread 0 name:  Dispatch queue: com.apple.main-thread
Thread 0 Crashed:
0   libsystem_kernel.dylib        	0x38af8dfc __pthread_kill + 8
1   libsystem_pthread.dylib       	0x38b78d0e pthread_kill + 58
2   libsystem_c.dylib             	0x38a98934 abort + 72
3   libc++abi.dylib               	0x37caabb8 abort_message + 84
4   libc++abi.dylib               	0x37cc466a default_terminate_handler() + 262
5   libobjc.A.dylib               	0x38497f0e _objc_terminate() + 190
6   libc++abi.dylib               	0x37cc1dec std::__terminate(void (*)()) + 76
7   libc++abi.dylib               	0x37cc18b4 __cxa_rethrow + 96
8   libobjc.A.dylib               	0x38497dba objc_exception_rethrow + 38
9   CoreFoundation                	0x2ac4ae48 CFRunLoopRunSpecific + 628
10  CoreFoundation                	0x2ac4abbe CFRunLoopRunInMode + 102
11  GraphicsServices              	0x31fd604c GSEventRunModal + 132
12  UIKit                         	0x2e216a2c UIApplicationMain + 1436
13  UINavigationControllerPushBug 	0x000b9556 main (main.m:14)
14  libdyld.dylib                 	0x38a33aac start + 0

Thread 1 name:  Dispatch queue: com.apple.libdispatch-manager
Thread 1:
0   libsystem_kernel.dylib        	0x38ae52c8 kevent64 + 24
1   libdispatch.dylib             	0x38a07ec4 _dispatch_mgr_invoke + 276
2   libdispatch.dylib             	0x38a07bf6 _dispatch_mgr_thread$VARIANT$mp + 34

Thread 2:
0   libsystem_kernel.dylib        	0x38af99cc __workq_kernreturn + 8
1   libsystem_pthread.dylib       	0x38b75e9c _pthread_wqthread + 788
2   libsystem_pthread.dylib       	0x38b75b74 start_wqthread + 4

Thread 3:
0   libsystem_kernel.dylib        	0x38af99cc __workq_kernreturn + 8
1   libsystem_pthread.dylib       	0x38b75e9c _pthread_wqthread + 788
2   libsystem_pthread.dylib       	0x38b75b74 start_wqthread + 4

Thread 4:
0   libsystem_kernel.dylib        	0x38af99cc __workq_kernreturn + 8
1   libsystem_pthread.dylib       	0x38b75e9c _pthread_wqthread + 788
2   libsystem_pthread.dylib       	0x38b75b74 start_wqthread + 4

Thread 5:
0   libsystem_kernel.dylib        	0x38af99cc __workq_kernreturn + 8
1   libsystem_pthread.dylib       	0x38b75e9c _pthread_wqthread + 788
2   libsystem_pthread.dylib       	0x38b75b74 start_wqthread + 4

Thread 0 crashed with ARM Thread State (32-bit):
    r0: 0x00000000    r1: 0x00000000      r2: 0x00000000      r3: 0x00000003
    r4: 0x00000006    r5: 0x3b1f69dc      r6: 0x3b1e2840      r7: 0x001cc3c8
    r8: 0x14e3b250    r9: 0x7420666f     r10: 0x3b1e1074     r11: 0x14e3b274
    ip: 0x00000148    sp: 0x001cc3bc      lr: 0x38b78d13      pc: 0x38af8dfc
  cpsr: 0x00000010

Binary Images:
0xb5000 - 0xbcfff UINavigationControllerPushBug armv7  <4b3e490d9f133e66a5322efd09768ace> /var/mobile/Containers/Bundle/Application/B32DA1B7-F0D8-41D5-96E7-C0EECF7BBCA7/UINavigationControllerPushBug.app/UINavigationControllerPushBug
0x1feb8000 - 0x1fedbfff dyld armv7  <6e778e287a303a9aaaf655849ae1d611> /usr/lib/dyld
0x297ee000 - 0x2995afff AVFoundation armv7  <82d1ce4181dc3bf4bd730f7492f05a92> /System/Library/Frameworks/AVFoundation.framework/AVFoundation
0x2995b000 - 0x299b9fff libAVFAudio.dylib armv7  <1b7ba3faa65c3850a72317a96ec43025> /System/Library/Frameworks/AVFoundation.framework/libAVFAudio.dylib
0x299f4000 - 0x299f4fff Accelerate armv7  <6489308d54873b748557138e7540d733> /System/Library/Frameworks/Accelerate.framework/Accelerate
0x29a05000 - 0x29c1efff vImage armv7  <9df0c9ce894a39f381ee083b84f63faa> /System/Library/Frameworks/Accelerate.framework/Frameworks/vImage.framework/vImage
0x29c1f000 - 0x29cfcfff libBLAS.dylib armv7  <f7c32b998307330ba5f35ecac6b06824> /System/Library/Frameworks/Accelerate.framework/Frameworks/vecLib.framework/libBLAS.dylib
0x29cfd000 - 0x29fc0fff libLAPACK.dylib armv7  <7964d0bd893432319fca6e8cddb2b119> /System/Library/Frameworks/Accelerate.framework/Frameworks/vecLib.framework/libLAPACK.dylib
0x29fc1000 - 0x29fd3fff libLinearAlgebra.dylib armv7  <c3f84b77ae383b5594fe0390218ecb8d> /System/Library/Frameworks/Accelerate.framework/Frameworks/vecLib.framework/libLinearAlgebra.dylib
0x29fd4000 - 0x2a049fff libvDSP.dylib armv7  <2e809e9146b536958f515517ed636a5e> /System/Library/Frameworks/Accelerate.framework/Frameworks/vecLib.framework/libvDSP.dylib
0x2a04a000 - 0x2a05bfff libvMisc.dylib armv7  <036ca731b2cf35cbb2762d08f6a16dfe> /System/Library/Frameworks/Accelerate.framework/Frameworks/vecLib.framework/libvMisc.dylib
0x2a05c000 - 0x2a05cfff vecLib armv7  <332674aaa39b3d94993ff677468b9d87> /System/Library/Frameworks/Accelerate.framework/Frameworks/vecLib.framework/vecLib
0x2a05d000 - 0x2a083fff Accounts armv7  <13071672ad5c35fe9ebad729d8cbf029> /System/Library/Frameworks/Accounts.framework/Accounts
0x2a085000 - 0x2a0f5fff AddressBook armv7  <3ca79f630bd93678ae5a115995754f5c> /System/Library/Frameworks/AddressBook.framework/AddressBook
0x2a3b0000 - 0x2a621fff AudioToolbox armv7  <503cd792e29c3a22a0e6797a3a1f052a> /System/Library/Frameworks/AudioToolbox.framework/AudioToolbox
0x2a787000 - 0x2a90efff CFNetwork armv7  <fa99828f278f3d6fae61a96388b3b52e> /System/Library/Frameworks/CFNetwork.framework/CFNetwork
0x2a990000 - 0x2a9eefff CoreAudio armv7  <711dada83c8c3c29aaf9d17c1e088a94> /System/Library/Frameworks/CoreAudio.framework/CoreAudio
0x2aa07000 - 0x2aa24fff CoreBluetooth armv7  <771793a76e38327390b62d1191240128> /System/Library/Frameworks/CoreBluetooth.framework/CoreBluetooth
0x2aa25000 - 0x2ac30fff CoreData armv7  <92438c5f749d35a18446ba947d7767db> /System/Library/Frameworks/CoreData.framework/CoreData
0x2ac31000 - 0x2af60fff CoreFoundation armv7  <50123e7208983ab8a3f8801b22df38f2> /System/Library/Frameworks/CoreFoundation.framework/CoreFoundation
0x2af61000 - 0x2b08afff CoreGraphics armv7  <66e9fc039182333c9ac1900bc3e787a8> /System/Library/Frameworks/CoreGraphics.framework/CoreGraphics
0x2b0ca000 - 0x2b0ccfff libCGXType.A.dylib armv7  <70ec36eaacb835acb41004592e122018> /System/Library/Frameworks/CoreGraphics.framework/Resources/libCGXType.A.dylib
0x2b0cd000 - 0x2b0d7fff libCMSBuiltin.A.dylib armv7  <10d337c33046387986d04e6a8d176286> /System/Library/Frameworks/CoreGraphics.framework/Resources/libCMSBuiltin.A.dylib
0x2b2bf000 - 0x2b2dafff libRIP.A.dylib armv7  <194c9ceb501d30a6ad1eea845b0fbcae> /System/Library/Frameworks/CoreGraphics.framework/Resources/libRIP.A.dylib
0x2b2db000 - 0x2b3e8fff CoreImage armv7  <52f3d145099233a1ae5bf151a30968c9> /System/Library/Frameworks/CoreImage.framework/CoreImage
0x2b472000 - 0x2b50cfff CoreMedia armv7  <cfaa8fe16921322a8d051be58f0ba5a8> /System/Library/Frameworks/CoreMedia.framework/CoreMedia
0x2b50d000 - 0x2b5cdfff CoreMotion armv7  <f6b92a7c724c314899e4ddc1a812fecc> /System/Library/Frameworks/CoreMotion.framework/CoreMotion
0x2b5ce000 - 0x2b62cfff CoreTelephony armv7  <1865940137713dcfae217d4b0de6958d> /System/Library/Frameworks/CoreTelephony.framework/CoreTelephony
0x2b62d000 - 0x2b6f4fff CoreText armv7  <44d68be1c4173eefb39dee7fb833ab5f> /System/Library/Frameworks/CoreText.framework/CoreText
0x2b6f5000 - 0x2b70afff CoreVideo armv7  <e73497bc01ad3dfa9021bbd545b238ec> /System/Library/Frameworks/CoreVideo.framework/CoreVideo
0x2b976000 - 0x2bb78fff Foundation armv7  <b2799048242f307c9892b904a9b36a09> /System/Library/Frameworks/Foundation.framework/Foundation
0x2bc58000 - 0x2bcaefff IOKit armv7  <cf83377abd033964b8ea67aa40a4f8fc> /System/Library/Frameworks/IOKit.framework/Versions/A/IOKit
0x2bcaf000 - 0x2bef1fff ImageIO armv7  <4d8d2eec2be7389f9bef4cc206ab1c51> /System/Library/Frameworks/ImageIO.framework/ImageIO
0x2bef2000 - 0x2c23bfff JavaScriptCore armv7  <f68088db48413473b5b08c8a81549667> /System/Library/Frameworks/JavaScriptCore.framework/JavaScriptCore
0x2c50a000 - 0x2c512fff MediaAccessibility armv7  <c46f7282336e3a3598119ed19753bcfe> /System/Library/Frameworks/MediaAccessibility.framework/MediaAccessibility
0x2c6ed000 - 0x2ca65fff MediaToolbox armv7  <6b17033e979c3cbdbe59068d214c3c8c> /System/Library/Frameworks/MediaToolbox.framework/MediaToolbox
0x2cb25000 - 0x2cb91fff Metal armv7  <d971a1b8b8d637a98f1c9131c6bc75c6> /System/Library/Frameworks/Metal.framework/Metal
0x2cb92000 - 0x2cc21fff MobileCoreServices armv7  <6350e1d9a8233b0b8663716cbc0255be> /System/Library/Frameworks/MobileCoreServices.framework/MobileCoreServices
0x2d6eb000 - 0x2d6f3fff OpenGLES armv7  <c87c554261393aa5bf85fac5c48ba03a> /System/Library/Frameworks/OpenGLES.framework/OpenGLES
0x2d6f5000 - 0x2d6f5fff libCVMSPluginSupport.dylib armv7  <e78a40f2f13c33dd8d80c8972f0da994> /System/Library/Frameworks/OpenGLES.framework/libCVMSPluginSupport.dylib
0x2d6f6000 - 0x2d6f8fff libCoreFSCache.dylib armv7  <464a9b4119763133a2d9351025007b45> /System/Library/Frameworks/OpenGLES.framework/libCoreFSCache.dylib
0x2d6f9000 - 0x2d6fcfff libCoreVMClient.dylib armv7  <d9e168b21cf63cb9b4cd49d30bfad66c> /System/Library/Frameworks/OpenGLES.framework/libCoreVMClient.dylib
0x2d6fd000 - 0x2d705fff libGFXShared.dylib armv7  <431e1f47629237109f9ab0ba085deab3> /System/Library/Frameworks/OpenGLES.framework/libGFXShared.dylib
0x2d706000 - 0x2d745fff libGLImage.dylib armv7  <0009f6d507073ee7891d95f6e2b12729> /System/Library/Frameworks/OpenGLES.framework/libGLImage.dylib
0x2dbd3000 - 0x2dd23fff QuartzCore armv7  <6245b916ab9d326e9de1b06c3ef06d8d> /System/Library/Frameworks/QuartzCore.framework/QuartzCore
0x2df65000 - 0x2dfa5fff Security armv7  <7cdab4ed556c3ffdb9faff4d07141431> /System/Library/Frameworks/Security.framework/Security
0x2e149000 - 0x2e1a5fff SystemConfiguration armv7  <184b320bb96d38bd90198ab7d330874e> /System/Library/Frameworks/SystemConfiguration.framework/SystemConfiguration
0x2e1a8000 - 0x2ea41fff UIKit armv7  <138d9c8feea63d80b08a7bc110bbdce7> /System/Library/Frameworks/UIKit.framework/UIKit
0x2ea42000 - 0x2eaa9fff VideoToolbox armv7  <d85f06b8d5b03255b1ed26b392f10356> /System/Library/Frameworks/VideoToolbox.framework/VideoToolbox
0x2f17b000 - 0x2f17ffff AggregateDictionary armv7  <b3a8631ab71b38dd89b8a5c12523e88b> /System/Library/PrivateFrameworks/AggregateDictionary.framework/AggregateDictionary
0x2f344000 - 0x2f36efff AirPlaySupport armv7  <701f2b977a83350dbcc270660cdeb9ab> /System/Library/PrivateFrameworks/AirPlaySupport.framework/AirPlaySupport
0x2f566000 - 0x2f5a4fff AppSupport armv7  <ef00e8bfb45f30eba14f2814991daecb> /System/Library/PrivateFrameworks/AppSupport.framework/AppSupport
0x2f6d3000 - 0x2f710fff AppleJPEG armv7  <bece852b679738698169770603dbe38a> /System/Library/PrivateFrameworks/AppleJPEG.framework/AppleJPEG
0x2f72e000 - 0x2f734fff AppleSRP armv7  <b6847dfcc40334ea9722d3f13554a46d> /System/Library/PrivateFrameworks/AppleSRP.framework/AppleSRP
0x2f769000 - 0x2f772fff AssertionServices armv7  <c977f6aef66130c39617094d607ee5c6> /System/Library/PrivateFrameworks/AssertionServices.framework/AssertionServices
0x2f773000 - 0x2f78bfff AssetsLibraryServices armv7  <635a3ad0b5d73847bacbe4a64b9bed28> /System/Library/PrivateFrameworks/AssetsLibraryServices.framework/AssetsLibraryServices
0x2f7df000 - 0x2f7e3fff BTLEAudioController armv7  <d93ccb2b76d83d4397f2d52d0453e553> /System/Library/PrivateFrameworks/BTLEAudioController.framework/BTLEAudioController
0x2f7e4000 - 0x2f7fbfff BackBoardServices armv7  <757aabecc11a30f1b0abc0fa1262d17e> /System/Library/PrivateFrameworks/BackBoardServices.framework/BackBoardServices
0x2f7fe000 - 0x2f833fff BaseBoard armv7  <91b34e60fd50334e9fc2b4567236cc65> /System/Library/PrivateFrameworks/BaseBoard.framework/BaseBoard
0x2f834000 - 0x2f83afff BluetoothManager armv7  <19d30b3a0ce83e028adcff4c45244677> /System/Library/PrivateFrameworks/BluetoothManager.framework/BluetoothManager
0x2fa62000 - 0x2fa6afff CaptiveNetwork armv7  <588eadc07ec13c5e8d309447f31a183e> /System/Library/PrivateFrameworks/CaptiveNetwork.framework/CaptiveNetwork
0x2fa6b000 - 0x2fb8dfff Celestial armv7  <3d9133a892cb3fdaa79a1e5dafca8821> /System/Library/PrivateFrameworks/Celestial.framework/Celestial
0x301a4000 - 0x301b4fff CommonUtilities armv7  <e94371f0c3af3df2b36c35c11e91e77a> /System/Library/PrivateFrameworks/CommonUtilities.framework/CommonUtilities
0x301b5000 - 0x301b9fff CommunicationsFilter armv7  <797d402b98a9374fb920676f8c03cd18> /System/Library/PrivateFrameworks/CommunicationsFilter.framework/CommunicationsFilter
0x30228000 - 0x3022cfff ConstantClasses armv7  <da2dc377cd593070aac7616e05a4cb93> /System/Library/PrivateFrameworks/ConstantClasses.framework/ConstantClasses
0x30266000 - 0x30269fff CoreAUC armv7  <73fc866359063f30baf942f7e3f61f60> /System/Library/PrivateFrameworks/CoreAUC.framework/CoreAUC
0x302e2000 - 0x302fbfff CoreDuet armv7  <8884c503754d3e11bef8665285845f4c> /System/Library/PrivateFrameworks/CoreDuet.framework/CoreDuet
0x30300000 - 0x3030ffff CoreDuetDaemonProtocol armv7  <b145140cf14733c78ab45771ac23a25a> /System/Library/PrivateFrameworks/CoreDuetDaemonProtocol.framework/CoreDuetDaemonProtocol
0x30316000 - 0x30318fff CoreDuetDebugLogging armv7  <5360d9f729b33046879514799ee116d6> /System/Library/PrivateFrameworks/CoreDuetDebugLogging.framework/CoreDuetDebugLogging
0x30900000 - 0x30980fff CoreUI armv7  <1c2e75c0a2973beb827d13d08802b2f1> /System/Library/PrivateFrameworks/CoreUI.framework/CoreUI
0x30981000 - 0x309eafff CoreUtils armv7  <33d430ac0c6931749a3fc020c2c31493> /System/Library/PrivateFrameworks/CoreUtils.framework/CoreUtils
0x309eb000 - 0x309f0fff CrashReporterSupport armv7  <b390f4fa5603386ea83d56f48fdeacd8> /System/Library/PrivateFrameworks/CrashReporterSupport.framework/CrashReporterSupport
0x30c3d000 - 0x30c5efff DataAccessExpress armv7  <68681cbe3ed937f6a74291ed288e2395> /System/Library/PrivateFrameworks/DataAccessExpress.framework/DataAccessExpress
0x30c9d000 - 0x30ca3fff DataMigration armv7  <50bff91cdbdf3a6ebe55c4cdfd1318b5> /System/Library/PrivateFrameworks/DataMigration.framework/DataMigration
0x30cad000 - 0x30caefff DiagnosticLogCollection armv7  <4d0d31ac66e43d03a4fba8eec2bebffe> /System/Library/PrivateFrameworks/DiagnosticLogCollection.framework/DiagnosticLogCollection
0x30caf000 - 0x30cc9fff DictionaryServices armv7  <606f886854653188a384feb88c727c6b> /System/Library/PrivateFrameworks/DictionaryServices.framework/DictionaryServices
0x30ce8000 - 0x30d07fff EAP8021X armv7  <1b02879f4e23365a83c8e9bb7e480729> /System/Library/PrivateFrameworks/EAP8021X.framework/EAP8021X
0x30e3a000 - 0x3125dfff FaceCore armv7  <96fe282a3c903468bccffee0f45ffa2a> /System/Library/PrivateFrameworks/FaceCore.framework/FaceCore
0x31282000 - 0x31282fff FontServices armv7  <00fa3270936839b4bb7c64f2be3e7f50> /System/Library/PrivateFrameworks/FontServices.framework/FontServices
0x31283000 - 0x31356fff libFontParser.dylib armv7  <a9532d1a53a138de80e57f38b4d585a1> /System/Library/PrivateFrameworks/FontServices.framework/libFontParser.dylib
0x31357000 - 0x31363fff libGSFontCache.dylib armv7  <e1ea799391e43de79fec5f1af55f6f7c> /System/Library/PrivateFrameworks/FontServices.framework/libGSFontCache.dylib
0x31446000 - 0x31461fff FrontBoardServices armv7  <bc58f1f043413960b218aeb7f8b50286> /System/Library/PrivateFrameworks/FrontBoardServices.framework/FrontBoardServices
0x31fcd000 - 0x31fddfff GraphicsServices armv7  <9efdf5cfa1b8391bbbf872c4496f5825> /System/Library/PrivateFrameworks/GraphicsServices.framework/GraphicsServices
0x3223f000 - 0x32295fff IDS armv7  <13c160f9f3ba38d6bbf0f6b3811ba1e4> /System/Library/PrivateFrameworks/IDS.framework/IDS
0x32296000 - 0x322b7fff IDSFoundation armv7  <709c320879a235b6886a0226796ec4ea> /System/Library/PrivateFrameworks/IDSFoundation.framework/IDSFoundation
0x32465000 - 0x324c9fff IMFoundation armv7  <3dace4bdefff3757b5e669b0c68b3518> /System/Library/PrivateFrameworks/IMFoundation.framework/IMFoundation
0x324d1000 - 0x324d4fff IOAccelerator armv7  <5b718623c85d3670b62447ace8d4b00d> /System/Library/PrivateFrameworks/IOAccelerator.framework/IOAccelerator
0x324d7000 - 0x324ddfff IOMobileFramebuffer armv7  <1f7e71ccb940316abc4d3c702d6d8830> /System/Library/PrivateFrameworks/IOMobileFramebuffer.framework/IOMobileFramebuffer
0x324de000 - 0x324e3fff IOSurface armv7  <30ff04d22c7632028ca42a4e0c97b2ae> /System/Library/PrivateFrameworks/IOSurface.framework/IOSurface
0x324e4000 - 0x324e5fff IOSurfaceAccelerator armv7  <ca94112c1c7e3d5f8f386e3d86fc22ca> /System/Library/PrivateFrameworks/IOSurfaceAccelerator.framework/IOSurfaceAccelerator
0x32588000 - 0x325befff LanguageModeling armv7  <b40438d2f27b389cb73743c61d3c011c> /System/Library/PrivateFrameworks/LanguageModeling.framework/LanguageModeling
0x3271a000 - 0x327b9fff ManagedConfiguration armv7  <3d453a4bdcd735caa12ec7bac4a430c8> /System/Library/PrivateFrameworks/ManagedConfiguration.framework/ManagedConfiguration
0x327c3000 - 0x327c4fff Marco armv7  <68cbf0bb03a23415af7f9a724f9f7d5c> /System/Library/PrivateFrameworks/Marco.framework/Marco
0x327c5000 - 0x3283cfff MediaControlSender armv7  <91c297b9dc3131d0afb22e56b628a230> /System/Library/PrivateFrameworks/MediaControlSender.framework/MediaControlSender
0x328db000 - 0x328edfff MediaRemote armv7  <eb5a6085e4433915be19daaf8f31c7e2> /System/Library/PrivateFrameworks/MediaRemote.framework/MediaRemote
0x328ee000 - 0x328fdfff MediaServices armv7  <1d6bd929ff1c3e92892315cadafba2d8> /System/Library/PrivateFrameworks/MediaServices.framework/MediaServices
0x32a72000 - 0x32a7ffff MobileAsset armv7  <876d4a6cda803783a7588999c2247225> /System/Library/PrivateFrameworks/MobileAsset.framework/MobileAsset
0x32aa6000 - 0x32aaffff MobileBluetooth armv7  <a323e89fcb3d35beab1f7dba97b3f0a1> /System/Library/PrivateFrameworks/MobileBluetooth.framework/MobileBluetooth
0x32ad3000 - 0x32adafff MobileInstallation armv7  <4af983ee77833064bc7503cbed22e164> /System/Library/PrivateFrameworks/MobileInstallation.framework/MobileInstallation
0x32adb000 - 0x32ae7fff MobileKeyBag armv7  <26e4ea84cc393fbdbec77b0024e144e7> /System/Library/PrivateFrameworks/MobileKeyBag.framework/MobileKeyBag
0x32b14000 - 0x32b17fff MobileSystemServices armv7  <ae4ef39d4c073c5395b7070df717326d> /System/Library/PrivateFrameworks/MobileSystemServices.framework/MobileSystemServices
0x32b39000 - 0x32b46fff MobileWiFi armv7  <156a2f7f3abb3dd79df11aeb6b9dab66> /System/Library/PrivateFrameworks/MobileWiFi.framework/MobileWiFi
0x32dbc000 - 0x32dc1fff Netrb armv7  <74cd9bc39770377d982a67cff76cccc7> /System/Library/PrivateFrameworks/Netrb.framework/Netrb
0x32dc2000 - 0x32dc8fff NetworkStatistics armv7  <9d8ed51a234836048ce9f8d711a60f72> /System/Library/PrivateFrameworks/NetworkStatistics.framework/NetworkStatistics
0x32dec000 - 0x32deefff OAuth armv7  <1b4ad044062c30d29f87f399bd847c25> /System/Library/PrivateFrameworks/OAuth.framework/OAuth
0x33546000 - 0x33582fff OpenCL armv7  <8c9c716a2de93b38be82b2277bb9632d> /System/Library/PrivateFrameworks/OpenCL.framework/OpenCL
0x33668000 - 0x3368ffff PersistentConnection armv7  <f0c9f9b0930c3925948e5b528515d1ac> /System/Library/PrivateFrameworks/PersistentConnection.framework/PersistentConnection
0x33a63000 - 0x33aadfff PhysicsKit armv7  <3d40d332c97c32ac80772192145ea414> /System/Library/PrivateFrameworks/PhysicsKit.framework/PhysicsKit
0x33aae000 - 0x33ac4fff PlugInKit armv7  <2886203577c73e94a363d3a98fbb4879> /System/Library/PrivateFrameworks/PlugInKit.framework/PlugInKit
0x33ac5000 - 0x33accfff PowerLog armv7  <e307e1f427233b1a83fe7134e49921ba> /System/Library/PrivateFrameworks/PowerLog.framework/PowerLog
0x33d6e000 - 0x33dabfff PrintKit armv7  <59173b68b2333f598a17dc7c56f569f4> /System/Library/PrivateFrameworks/PrintKit.framework/PrintKit
0x33db0000 - 0x33e44fff ProofReader armv7  <b9f28c4e72fc309e907b939d493127b8> /System/Library/PrivateFrameworks/ProofReader.framework/ProofReader
0x33e94000 - 0x33f02fff Quagga armv7  <8276ca0278403a45a6ec46bf05b050f3> /System/Library/PrivateFrameworks/Quagga.framework/Quagga
0x34315000 - 0x3432ffff SpringBoardServices armv7  <960b4be1356f38e89f870af9987aae41> /System/Library/PrivateFrameworks/SpringBoardServices.framework/SpringBoardServices
0x3469a000 - 0x347b2fff StoreServices armv7  <08c51ed16c4c3da0b465e3e6bb6e56a0> /System/Library/PrivateFrameworks/StoreServices.framework/StoreServices
0x34884000 - 0x34886fff TCC armv7  <bd765a3a2cc736a0925aeeae1b246631> /System/Library/PrivateFrameworks/TCC.framework/TCC
0x348cd000 - 0x3490afff TelephonyUtilities armv7  <87c96336d7b433b1bd54f9a0efbc8fed> /System/Library/PrivateFrameworks/TelephonyUtilities.framework/TelephonyUtilities
0x3546c000 - 0x35493fff TextInput armv7  <2c5cc34e04d8316c9eaf54177d191916> /System/Library/PrivateFrameworks/TextInput.framework/TextInput
0x35546000 - 0x35606fff UIFoundation armv7  <428374a21c553f4892ffd62a9e50f499> /System/Library/PrivateFrameworks/UIFoundation.framework/UIFoundation
0x35623000 - 0x35626fff UserFS armv7  <897a747e849e3128a52593f4e311783c> /System/Library/PrivateFrameworks/UserFS.framework/UserFS
0x35e80000 - 0x369f4fff WebCore armv7  <4453f473bc773bbb863cde0919a18749> /System/Library/PrivateFrameworks/WebCore.framework/WebCore
0x369f5000 - 0x36ab3fff WebKitLegacy armv7  <d5184a7aeee03189b65ca65c48fe5f10> /System/Library/PrivateFrameworks/WebKitLegacy.framework/WebKitLegacy
0x3762f000 - 0x37637fff libAccessibility.dylib armv7  <32190dda98163ebbb0643169fc09b1a5> /usr/lib/libAccessibility.dylib
0x3788b000 - 0x378a1fff libCRFSuite.dylib armv7  <0a5fee6c5fb13987a0014c7e6db619aa> /usr/lib/libCRFSuite.dylib
0x378d3000 - 0x379d6fff libFosl_dynamic.dylib armv7  <1b7e35e68bb13a7885642804a30db6cc> /usr/lib/libFosl_dynamic.dylib
0x379f0000 - 0x37a0afff libMobileGestalt.dylib armv7  <b8857e7870e537d98b1d0ae6aaa083ff> /usr/lib/libMobileGestalt.dylib
0x37a30000 - 0x37a31fff libSystem.B.dylib armv7  <f8d939cc441439e7b2855a6ef4d77c08> /usr/lib/libSystem.B.dylib
0x37aa2000 - 0x37ae6fff libTelephonyUtilDynamic.dylib armv7  <ad405763cdac370bb854e61772bf394a> /usr/lib/libTelephonyUtilDynamic.dylib
0x37bf6000 - 0x37c18fff libarchive.2.dylib armv7  <4ed6612a4606309b975cbc258ba02c4f> /usr/lib/libarchive.2.dylib
0x37c48000 - 0x37c54fff libbsm.0.dylib armv7  <1d4e1966264c32f38d75e858496cf7f8> /usr/lib/libbsm.0.dylib
0x37c55000 - 0x37c5efff libbz2.1.0.dylib armv7  <4b7ac694d66732dc9ea3d1d05f012df7> /usr/lib/libbz2.1.0.dylib
0x37c5f000 - 0x37ca9fff libc++.1.dylib armv7  <31d0bc3ad77a36f78c370c6d154f50d4> /usr/lib/libc++.1.dylib
0x37caa000 - 0x37cc5fff libc++abi.dylib armv7  <8651f217a2113143b778e44e36676179> /usr/lib/libc++abi.dylib
0x37cc7000 - 0x37cd4fff libcmph.dylib armv7  <73d53cf7c39237759bfd66e8050dd5ae> /usr/lib/libcmph.dylib
0x37d04000 - 0x37d1cfff libextension.dylib armv7  <cd9c4b4d72b9359f9fc0dfb9d4a871bc> /usr/lib/libextension.dylib
0x37e51000 - 0x37f3efff libiconv.2.dylib armv7  <1b0fd67a32a23c998b57ab552f1562cf> /usr/lib/libiconv.2.dylib
0x37f3f000 - 0x380acfff libicucore.A.dylib armv7  <f4c624598fbf37b0bbee174fac154d91> /usr/lib/libicucore.A.dylib
0x380b9000 - 0x380b9fff liblangid.dylib armv7  <ac2f558933ab3a9bbc0f376833feb5da> /usr/lib/liblangid.dylib
0x380ba000 - 0x380c4fff liblockdown.dylib armv7  <ea95ceffad2531eaa6433591b81c57f3> /usr/lib/liblockdown.dylib
0x380c5000 - 0x380dafff liblzma.5.dylib armv7  <c7608f137e0c3fc892a214899dc3364e> /usr/lib/liblzma.5.dylib
0x38452000 - 0x38466fff libmis.dylib armv7  <8fea81a19fa8324c8afe054d17b5e529> /usr/lib/libmis.dylib
0x38491000 - 0x3868bfff libobjc.A.dylib armv7  <3dfb8b1d89c53df7be0b4d8b17b51b6b> /usr/lib/libobjc.A.dylib
0x38740000 - 0x38756fff libresolv.9.dylib armv7  <dd12c5d28f193f46aa1dcffbecdaaa4e> /usr/lib/libresolv.9.dylib
0x38781000 - 0x38826fff libsqlite3.dylib armv7  <0aacf80bb3573654b41574dc849aeb4f> /usr/lib/libsqlite3.dylib
0x38874000 - 0x3889bfff libtidy.A.dylib armv7  <f42dd1583f533d5ebf43cea1436f8f6f> /usr/lib/libtidy.A.dylib
0x388a8000 - 0x3895efff libxml2.2.dylib armv7  <e766a404f6ef3eb482ad641bdc4c5b16> /usr/lib/libxml2.2.dylib
0x3895f000 - 0x38980fff libxslt.1.dylib armv7  <a53526d8b3b73c04a3d6b8d6a02b9639> /usr/lib/libxslt.1.dylib
0x38981000 - 0x3898dfff libz.1.dylib armv7  <6e6680acca983153ae913c0c17a6c1cd> /usr/lib/libz.1.dylib
0x3898e000 - 0x38992fff libcache.dylib armv7  <9961bace92213372ab8863cdfb3a29d6> /usr/lib/system/libcache.dylib
0x38993000 - 0x3899cfff libcommonCrypto.dylib armv7  <1de129ade05e38949012159687a5c051> /usr/lib/system/libcommonCrypto.dylib
0x3899d000 - 0x389a1fff libcompiler_rt.dylib armv7  <5c4da79950b53afe84ace67fb55833c4> /usr/lib/system/libcompiler_rt.dylib
0x389a2000 - 0x389a8fff libcopyfile.dylib armv7  <30fa82f404f63dc1a5d3cc5e3491335d> /usr/lib/system/libcopyfile.dylib
0x389a9000 - 0x389f5fff libcorecrypto.dylib armv7  <eff1ee3e2472389c9be2abbaa995a213> /usr/lib/system/libcorecrypto.dylib
0x389f6000 - 0x38a31fff libdispatch.dylib armv7  <429ae50a967737d6b5b4a05c3de017e2> /usr/lib/system/libdispatch.dylib
0x38a32000 - 0x38a33fff libdyld.dylib armv7  <5085dc61f4c03595bb85b15629273fbc> /usr/lib/system/libdyld.dylib
0x38a34000 - 0x38a34fff libkeymgr.dylib armv7  <262bd92918bd3c1c9eb6fcaa3791775e> /usr/lib/system/libkeymgr.dylib
0x38a35000 - 0x38a35fff liblaunch.dylib armv7  <ded7a799dc293fb98cf67551ca948c7f> /usr/lib/system/liblaunch.dylib
0x38a36000 - 0x38a39fff libmacho.dylib armv7  <239e78697d683d6991a2a9c0044474b3> /usr/lib/system/libmacho.dylib
0x38a3a000 - 0x38a3bfff libremovefile.dylib armv7  <0557b72ca4a3362e884d7cff30e8cafb> /usr/lib/system/libremovefile.dylib
0x38a3c000 - 0x38a4dfff libsystem_asl.dylib armv7  <70cf5e1898f13ce18eb75f3458dbd796> /usr/lib/system/libsystem_asl.dylib
0x38a4e000 - 0x38a4efff libsystem_blocks.dylib armv7  <0c999fc715d3379a82ba8c6354709999> /usr/lib/system/libsystem_blocks.dylib
0x38a4f000 - 0x38ab1fff libsystem_c.dylib armv7  <cab1d3836e903af7bce3e4e60a34fccb> /usr/lib/system/libsystem_c.dylib
0x38ab2000 - 0x38ab4fff libsystem_configuration.dylib armv7  <d7cbf07df41a3ea997b79a821ded7d97> /usr/lib/system/libsystem_configuration.dylib
0x38ab5000 - 0x38ab6fff libsystem_coreservices.dylib armv7  <4b9f774a6d3b3ca79c2fe7d1d45b8b22> /usr/lib/system/libsystem_coreservices.dylib
0x38ab7000 - 0x38ac3fff libsystem_coretls.dylib armv7  <0cc38bb44c223315b61e3dd8ba7c98b6> /usr/lib/system/libsystem_coretls.dylib
0x38ac4000 - 0x38acafff libsystem_dnssd.dylib armv7  <cc3c60b9d86732c7a53f794c7d09debc> /usr/lib/system/libsystem_dnssd.dylib
0x38acb000 - 0x38ae3fff libsystem_info.dylib armv7  <30d86b05ccfc364c80512007c565d251> /usr/lib/system/libsystem_info.dylib
0x38ae4000 - 0x38afefff libsystem_kernel.dylib armv7  <00aa93fc92383f9db118534f8851cc2a> /usr/lib/system/libsystem_kernel.dylib
0x38aff000 - 0x38b1ffff libsystem_m.dylib armv7  <78dafecdbdc136da89fa5a9f4bb571b7> /usr/lib/system/libsystem_m.dylib
0x38b20000 - 0x38b32fff libsystem_malloc.dylib armv7  <1cbb1e6f834f352cada0bfe6aae7ced1> /usr/lib/system/libsystem_malloc.dylib
0x38b33000 - 0x38b60fff libsystem_network.dylib armv7  <d9711d62164c37e084aa419ed251c264> /usr/lib/system/libsystem_network.dylib
0x38b61000 - 0x38b66fff libsystem_networkextension.dylib armv7  <9e633ce07c5631f0b08ea45b745ee3a6> /usr/lib/system/libsystem_networkextension.dylib
0x38b67000 - 0x38b6efff libsystem_notify.dylib armv7  <2c4117afd36435a795a2c2367723434e> /usr/lib/system/libsystem_notify.dylib
0x38b6f000 - 0x38b74fff libsystem_platform.dylib armv7  <f36fba051a0833fa889eb0bd2cd81875> /usr/lib/system/libsystem_platform.dylib
0x38b75000 - 0x38b7bfff libsystem_pthread.dylib armv7  <f4ec7178f33f3366ac51b475b6105ba2> /usr/lib/system/libsystem_pthread.dylib
0x38b7c000 - 0x38b7efff libsystem_sandbox.dylib armv7  <d2a92447495235bb915ea76606b37012> /usr/lib/system/libsystem_sandbox.dylib
0x38b7f000 - 0x38b82fff libsystem_stats.dylib armv7  <dfc8455c709d34b39f0b82ca4d497e2d> /usr/lib/system/libsystem_stats.dylib
0x38b83000 - 0x38b88fff libsystem_trace.dylib armv7  <e82b8baeae2739ee8ce1cb26784a7f79> /usr/lib/system/libsystem_trace.dylib
0x38b89000 - 0x38b89fff libunwind.dylib armv7  <8c41ef1c4e4733ac87472a1910dfe445> /usr/lib/system/libunwind.dylib
0x38b8a000 - 0x38ba5fff libxpc.dylib armv7  <84e1bee3b89739dd9a7bd061b6b252c5> /usr/lib/system/libxpc.dylib

~~~

经过一翻 google + SO， 结论是一个UINavigationController同一时刻同时push多个VC，这个触发的原因肯能是因为有些用户手速太快，同一时刻点击了多次触发切转的视图，至于用户手速为什么这么快，这里就不做分析了（斜眼笑/_/）。 言归正传，用分类+swizzle 或者 子类一个 UINavigationController，在push方法里加个标志位，当push时置位，push完成时重置该标记位。
言归正传，直接上代码

~~~

#import "XDNavigationController.h"

@interface XDNavigationController () <UINavigationControllerDelegate>

@property (nonatomic, assign) BOOL shouldIgnorePushingViewControllers;

@property (weak, nonatomic) id <UINavigationControllerDelegate> originalDelegate;

@end

@implementation XDNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    [super setDelegate:self];
}


- (void)setDelegate:(id<UINavigationControllerDelegate>)delegate {
    if (delegate != self) {
        self.originalDelegate = delegate;
    }
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    if (!self.shouldIgnorePushingViewControllers) {
        [super pushViewController:viewController animated:animated];
    }
    self.shouldIgnorePushingViewControllers = YES;
}

#pragma mark - UINavigationControllerDelegate
- (void)navigationController:(UINavigationController *)navigationController
      willShowViewController:(UIViewController *)viewController
                    animated:(BOOL)animated {
    if (self.originalDelegate && [self.originalDelegate respondsToSelector:@selector(navigationController:willShowViewController:animated:)]) {
        [self.originalDelegate navigationController:navigationController
                             willShowViewController:viewController
                                           animated:animated];
    }
}

- (void)navigationController:(UINavigationController *)navigationController
       didShowViewController:(UIViewController *)viewController
                    animated:(BOOL)animated {
    if (self.originalDelegate && [self.originalDelegate respondsToSelector:@selector(navigationController:didShowViewController:animated:)]) {
        [self.originalDelegate navigationController:navigationController
                              didShowViewController:viewController
                                           animated:animated];
    }
    self.shouldIgnorePushingViewControllers = NO;
}

- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                  animationControllerForOperation:(UINavigationControllerOperation)operation
                                               fromViewController:(UIViewController *)fromVC
                                                 toViewController:(UIViewController *)toVC {
    if (self.originalDelegate && [self.originalDelegate respondsToSelector:@selector(navigationController:animationControllerForOperation:fromViewController:toViewController:)]) {
        return [self.originalDelegate navigationController:navigationController
                           animationControllerForOperation:operation fromViewController:fromVC toViewController:toVC];
    }
    return nil;
}

- (id<UIViewControllerInteractiveTransitioning>)navigationController:(UINavigationController *)navigationController interactionControllerForAnimationController:(id<UIViewControllerAnimatedTransitioning>)animationController {
    if (self.originalDelegate && [self.originalDelegate respondsToSelector:@selector(navigationController:interactionControllerForAnimationController:)]) {
        return [self.originalDelegate navigationController:navigationController interactionControllerForAnimationController:animationController];
    }
    return nil;
}


@end

~~~

也可以参考[StackOverflow： https://stackoverflow.com/questions/19560198/ios-app-error-cant-add-self-as-subview](https://stackoverflow.com/questions/19560198/ios-app-error-cant-add-self-as-subview) 上的其他做法，大致思路都差不多。


