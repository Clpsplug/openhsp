#ifndef APPENGINE_H
#define APPENGINE_H

#include <errno.h>


/**
 * �ĊJ�ɕK�v�ȕۑ����ׂ��f�[�^
 */
struct saved_state
{
    int32_t x;
    int32_t y;
};

/**
 * �A�v���P�[�V�������ŋ��ʂ��ė��p������
 */
struct engine
{
    struct android_app* app;
};

#endif
