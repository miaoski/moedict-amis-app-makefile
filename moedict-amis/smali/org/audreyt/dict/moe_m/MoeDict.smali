.class public Lorg/audreyt/dict/moe_m/MoeDict;
.super Lorg/apache/cordova/CordovaActivity;
.source "MoeDict.java"


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 32
    invoke-direct {p0}, Lorg/apache/cordova/CordovaActivity;-><init>()V

    return-void
.end method


# virtual methods
.method public onCreate(Landroid/os/Bundle;)V
    .locals 3
    .param p1, "savedInstanceState"    # Landroid/os/Bundle;

    .prologue
    const/16 v2, 0x9c4

    .line 37
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x13

    if-lt v0, v1, :cond_0

    .line 38
    invoke-virtual {p0}, Lorg/audreyt/dict/moe_m/MoeDict;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v0

    const/4 v1, 0x2

    iput v1, v0, Landroid/content/pm/ApplicationInfo;->flags:I

    .line 39
    const-string v0, "Your app"

    const-string v1, "Enabling web debugging"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 40
    const/4 v0, 0x1

    invoke-static {v0}, Landroid/webkit/WebView;->setWebContentsDebuggingEnabled(Z)V

    .line 43
    :cond_0
    invoke-super {p0, p1}, Lorg/apache/cordova/CordovaActivity;->onCreate(Landroid/os/Bundle;)V

    .line 44
    invoke-super {p0}, Lorg/apache/cordova/CordovaActivity;->init()V

    .line 46
    const-string v0, "splashscreen"

    const v1, 0x7f020008

    invoke-super {p0, v0, v1}, Lorg/apache/cordova/CordovaActivity;->setIntegerProperty(Ljava/lang/String;I)V

    .line 47
    sget-object v0, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    const-string v1, "2."

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 48
    const-string v0, "file:///android_asset/www/index.no-react.html"

    invoke-super {p0, v0, v2}, Lorg/apache/cordova/CordovaActivity;->loadUrl(Ljava/lang/String;I)V

    .line 54
    :goto_0
    return-void

    .line 51
    :cond_1
    invoke-static {}, Lorg/apache/cordova/Config;->getStartUrl()Ljava/lang/String;

    move-result-object v0

    invoke-super {p0, v0, v2}, Lorg/apache/cordova/CordovaActivity;->loadUrl(Ljava/lang/String;I)V

    goto :goto_0
.end method

.method public onCreateOptionsMenu(Landroid/view/Menu;)Z
    .locals 2
    .param p1, "menu"    # Landroid/view/Menu;

    .prologue
    .line 58
    invoke-virtual {p0}, Lorg/audreyt/dict/moe_m/MoeDict;->getMenuInflater()Landroid/view/MenuInflater;

    move-result-object v0

    const/high16 v1, 0x7f060000

    invoke-virtual {v0, v1, p1}, Landroid/view/MenuInflater;->inflate(ILandroid/view/Menu;)V

    .line 59
    const/4 v0, 0x1

    return v0
.end method

.method public onOptionsItemSelected(Landroid/view/MenuItem;)Z
    .locals 3
    .param p1, "item"    # Landroid/view/MenuItem;

    .prologue
    .line 64
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    .line 65
    .local v0, "id":I
    const/high16 v1, 0x7f070000

    if-ne v0, v1, :cond_0

    .line 66
    iget-object v1, p0, Lorg/audreyt/dict/moe_m/MoeDict;->appView:Lorg/apache/cordova/CordovaWebView;

    const-string v2, "javascript:window.adjustFontSize(-1);"

    invoke-virtual {v1, v2}, Lorg/apache/cordova/CordovaWebView;->loadUrl(Ljava/lang/String;)V

    .line 81
    :goto_0
    const/4 v1, 0x1

    :goto_1
    return v1

    .line 68
    :cond_0
    const v1, 0x7f070001

    if-ne v0, v1, :cond_1

    .line 69
    iget-object v1, p0, Lorg/audreyt/dict/moe_m/MoeDict;->appView:Lorg/apache/cordova/CordovaWebView;

    const-string v2, "javascript:window.adjustFontSize(+1);"

    invoke-virtual {v1, v2}, Lorg/apache/cordova/CordovaWebView;->loadUrl(Ljava/lang/String;)V

    goto :goto_0

    .line 71
    :cond_1
    const v1, 0x7f070002

    if-ne v0, v1, :cond_2

    .line 72
    invoke-virtual {p0}, Lorg/audreyt/dict/moe_m/MoeDict;->finish()V

    .line 73
    const/4 v1, 0x0

    invoke-static {v1}, Ljava/lang/System;->exit(I)V

    goto :goto_0

    .line 75
    :cond_2
    const v1, 0x7f070003

    if-ne v0, v1, :cond_3

    .line 76
    iget-object v1, p0, Lorg/audreyt/dict/moe_m/MoeDict;->appView:Lorg/apache/cordova/CordovaWebView;

    const-string v2, "javascript:window.pressLang();"

    invoke-virtual {v1, v2}, Lorg/apache/cordova/CordovaWebView;->loadUrl(Ljava/lang/String;)V

    goto :goto_0

    .line 79
    :cond_3
    invoke-super {p0, p1}, Lorg/apache/cordova/CordovaActivity;->onOptionsItemSelected(Landroid/view/MenuItem;)Z

    move-result v1

    goto :goto_1
.end method

.method public onReceivedError(ILjava/lang/String;Ljava/lang/String;)V
    .locals 0
    .param p1, "errorCode"    # I
    .param p2, "description"    # Ljava/lang/String;
    .param p3, "failingUrl"    # Ljava/lang/String;

    .prologue
    .line 86
    return-void
.end method
