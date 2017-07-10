//
//  3DSaverTestView.m
//  3DSaverTest
//
//  Created by k1ds3ns4t10n on 4/12/17.
//  Copyright © 2017 Gameaholix. All rights reserved.
//

#import "3DSaverTestView.h"

@implementation Gameaholix_3DSaverTestView

- (instancetype)initWithFrame:(NSRect)frame isPreview:(BOOL)isPreview
{
    self = [super initWithFrame:frame isPreview:isPreview];
    if (self) {
        NSOpenGLPixelFormatAttribute attributes[] = {
            NSOpenGLPFAAccelerated,
            NSOpenGLPFADepthSize, 16,
            NSOpenGLPFAMinimumPolicy,
            NSOpenGLPFAClosestPolicy,
            0 };
        
        NSOpenGLPixelFormat *format;
        format = [[NSOpenGLPixelFormat alloc] initWithAttributes:attributes];
        
        glView = [[MyOpenGLView alloc] initWithFrame:NSZeroRect pixelFormat:format];
        
        if (!glView)
        {
            NSLog(@"Couldn't initialize OpenGL view.");
            return nil;
        }
        
        [self addSubview:glView];
        [self setUpOpenGL];
        
        [self setAnimationTimeInterval:1/30.0];
    }
    return self;
}

- (void)startAnimation
{
    [super startAnimation];
}

- (void)stopAnimation
{
    [super stopAnimation];
}

- (void)drawRect:(NSRect)rect
{
    [super drawRect:rect];
    
    [[glView openGLContext] makeCurrentContext];
    
    glClear( GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT );   // clear the screen and the depth buffer
    glLoadIdentity();   // reset the view
    
    glTranslatef( -1.6f, 0.0f, -6.0f );
    glRotatef( rotation*3.0, 0.0f, 1.0f, 0.0f );
    
    // cube
    glBegin(GL_QUADS);
    {
        // top ccw
        glColor3f(0.0f,1.0f,0.0f);          // Set The Color To Green
        glVertex3f( 1.0f, 1.0f,-1.0f);          // Top Right Of The Quad (Top)
        glVertex3f(-1.0f, 1.0f,-1.0f);          // Top Left Of The Quad (Top)
        glVertex3f(-1.0f, 1.0f, 1.0f);          // Bottom Left Of The Quad (Top)
        glVertex3f( 1.0f, 1.0f, 1.0f);          // Bottom Right Of The Quad (Top)
        
        // bottom ccw
        glColor3f(1.0f,0.5f,0.0f);          // Set The Color To Orange
        glVertex3f( 1.0f,-1.0f, 1.0f);          // Top Right Of The Quad (Bottom)
        glVertex3f(-1.0f,-1.0f, 1.0f);          // Top Left Of The Quad (Bottom)
        glVertex3f(-1.0f,-1.0f,-1.0f);          // Bottom Left Of The Quad (Bottom)
        glVertex3f( 1.0f,-1.0f,-1.0f);          // Bottom Right Of The Quad (Bottom)
        
        // front ccw
        glColor3f(1.0f,0.0f,0.0f);          // Set The Color To Red
        glVertex3f( 1.0f, 1.0f, 1.0f);          // Top Right Of The Quad (Front)
        glVertex3f(-1.0f, 1.0f, 1.0f);          // Top Left Of The Quad (Front)
        glVertex3f(-1.0f,-1.0f, 1.0f);          // Bottom Left Of The Quad (Front)
        glVertex3f( 1.0f,-1.0f, 1.0f);          // Bottom Right Of The Quad (Front)
        
        // back ccw
        glColor3f(1.0f,1.0f,0.0f);          // Set The Color To Yellow
        glVertex3f( 1.0f,-1.0f,-1.0f);          // Bottom Left Of The Quad (Back)
        glVertex3f(-1.0f,-1.0f,-1.0f);          // Bottom Right Of The Quad (Back)
        glVertex3f(-1.0f, 1.0f,-1.0f);          // Top Right Of The Quad (Back)
        glVertex3f( 1.0f, 1.0f,-1.0f);          // Top Left Of The Quad (Back)
        
        // left ccw
        glColor3f(0.0f,0.0f,1.0f);          // Set The Color To Blue
        glVertex3f(-1.0f, 1.0f, 1.0f);          // Top Right Of The Quad (Left)
        glVertex3f(-1.0f, 1.0f,-1.0f);          // Top Left Of The Quad (Left)
        glVertex3f(-1.0f,-1.0f,-1.0f);          // Bottom Left Of The Quad (Left)
        glVertex3f(-1.0f,-1.0f, 1.0f);          // Bottom Right Of The Quad (Left)
        
        // right ccw
        glColor3f(1.0f,0.0f,1.0f);          // Set The Color To Violet
        glVertex3f( 1.0f, 1.0f,-1.0f);          // Top Right Of The Quad (Right)
        glVertex3f( 1.0f, 1.0f, 1.0f);          // Top Left Of The Quad (Right)
        glVertex3f( 1.0f,-1.0f, 1.0f);          // Bottom Left Of The Quad (Right)
        glVertex3f( 1.0f,-1.0f,-1.0f);          // Bottom Right Of The Quad (Right)
    }
    glEnd();
    
//    glLoadIdentity();
    glTranslatef( 1.6f, 0.0f, 0.0f );
    
    // sphere
    glColor3f (0.8f, 0.2f, 0.1f);
    GLUquadricObj* pQuadric = gluNewQuadric();
    gluSphere (pQuadric, 1.0f, 50, 50);
    
    glTranslatef( 1.4f, 0.0f, 0.0f );
//    glRotatef( triRotation*4, 0.0f, 1.0f, 0.0f );
    
    // pyramid
    glBegin( GL_TRIANGLES );
    {
        glColor3f( 1.0f, 0.0f, 0.0f );
        glVertex3f( 0.0f,  1.0f, 0.0f );
        glColor3f( 0.0f, 1.0f, 0.0f );
        glVertex3f( -1.0f, -1.0f, 1.0f );
        glColor3f( 0.0f, 0.0f, 1.0f );
        glVertex3f( 1.0f, -1.0f, 1.0f );
        
        glColor3f( 1.0f, 0.0f, 0.0f );
        glVertex3f( 0.0f, 1.0f, 0.0f );
        glColor3f( 0.0f, 0.0f, 1.0f );
        glVertex3f( 1.0f, -1.0f, 1.0f );
        glColor3f( 0.0f, 1.0f, 0.0f );
        glVertex3f( 1.0f, -1.0f, -1.0f );
        
        glColor3f( 1.0f, 0.0f, 0.0f );
        glVertex3f( 0.0f, 1.0f, 0.0f );
        glColor3f( 0.0f, 1.0f, 0.0f );
        glVertex3f( 1.0f, -1.0f, -1.0f );
        glColor3f( 0.0f, 0.0f, 1.0f );
        glVertex3f( -1.0f, -1.0f, -1.0f );
        
        glColor3f( 1.0f, 0.0f, 0.0f );
        glVertex3f( 0.0f, 1.0f, 0.0f );
        glColor3f( 0.0f, 0.0f, 1.0f );
        glVertex3f( -1.0f, -1.0f, -1.0f );
        glColor3f( 0.0f, 1.0f, 0.0f );
        glVertex3f( -1.0f, -1.0f, 1.0f );
    }
    glEnd();
    
    glFlush();
}

- (void)animateOneFrame
{
    // adjust our state
    rotation += 0.2f;
    triRotation += 0.2f;
    
    // redraw
    [self setNeedsDisplay:YES];
}

- (BOOL)hasConfigureSheet
{
    return NO;
}

- (NSWindow*)configureSheet
{
    return nil;
}

- (void)setUpOpenGL
{
    [[glView openGLContext] makeCurrentContext];
    
    glShadeModel(GL_SMOOTH);
    glClearColor(0.5f,0.0f,0.0f,0.0f);
    glClearDepth(1.0f);
    glEnable(GL_DEPTH_TEST);
    glDepthFunc(GL_LEQUAL);
    glHint(GL_PERSPECTIVE_CORRECTION_HINT, GL_NICEST);
    
    rotation = 0.0f;
    triRotation = 0.0f;
}

- (void)setFrameSize:(NSSize)newSize
{
    [super setFrameSize:newSize];
    [glView setFrameSize:newSize];
    
    [[glView openGLContext] makeCurrentContext];
    
    // reshape
    glViewport(0, 0, (GLsizei)newSize.width, (GLsizei)newSize.height);
    glMatrixMode(GL_PROJECTION);
    glLoadIdentity();
    gluPerspective(45.0f,(GLfloat)newSize.width / (GLfloat)newSize.height, 0.1f, 100.0f);
    glMatrixMode(GL_MODELVIEW);
    glLoadIdentity();
    
    [[glView openGLContext] update];
    
}

- (void)dealloc
{
    [glView removeFromSuperview];
}

@end
