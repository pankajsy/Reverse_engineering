.class public Lcom/keepassdroid/database/PwEntry$EntryNameComparator;
.super Ljava/lang/Object;
.source "PwEntry.java"

# interfaces
.implements Ljava/util/Comparator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/keepassdroid/database/PwEntry;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "EntryNameComparator"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Comparator",
        "<",
        "Lcom/keepassdroid/database/PwEntry;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .prologue
    .line 33
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public compare(Lcom/keepassdroid/database/PwEntry;Lcom/keepassdroid/database/PwEntry;)I
    .locals 2
    .param p1, "object1"    # Lcom/keepassdroid/database/PwEntry;
    .param p2, "object2"    # Lcom/keepassdroid/database/PwEntry;

    .prologue
    .line 36
    invoke-virtual {p1}, Lcom/keepassdroid/database/PwEntry;->getTitle()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p2}, Lcom/keepassdroid/database/PwEntry;->getTitle()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->compareToIgnoreCase(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method public bridge synthetic compare(Ljava/lang/Object;Ljava/lang/Object;)I
    .locals 1

    .prologue
    .line 33
    check-cast p1, Lcom/keepassdroid/database/PwEntry;

    check-cast p2, Lcom/keepassdroid/database/PwEntry;

    invoke-virtual {p0, p1, p2}, Lcom/keepassdroid/database/PwEntry$EntryNameComparator;->compare(Lcom/keepassdroid/database/PwEntry;Lcom/keepassdroid/database/PwEntry;)I

    move-result v0

    return v0
.end method
