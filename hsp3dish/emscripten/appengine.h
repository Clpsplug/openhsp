#ifndef APPENGINE_H
#define APPENGINE_H

#include <errno.h>


/**
 * 再開に必要な保存すべきデータ
 */
struct saved_state
{
    int32_t x;
    int32_t y;
};

/**
 * アプリケーション内で共通して利用する情報
 */
struct engine
{
    struct android_app* app;
};

#endif
