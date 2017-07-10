//
//  3DSaverTestView.h
//  3DSaverTest
//
//  Created by k1ds3ns4t10n on 4/12/17.
//  Copyright © 2017 Gameaholix. All rights reserved.
//

#import <ScreenSaver/ScreenSaver.h>
#import <OpenGL/gl.h>
#import <OpenGL/glu.h>

#import "MyOpenGLView.h"

@interface Gameaholix_3DSaverTestView : ScreenSaverView
{
    MyOpenGLView *glView;
    GLfloat rotation;
    GLfloat triRotation;
    GLuint texture[1];
}

- (void)setUpOpenGL;

@end
