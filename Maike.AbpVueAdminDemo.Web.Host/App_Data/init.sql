IF OBJECT_ID(N'[__EFMigrationsHistory]') IS NULL
BEGIN
    CREATE TABLE [__EFMigrationsHistory] (
        [MigrationId] nvarchar(150) NOT NULL,
        [ProductVersion] nvarchar(32) NOT NULL,
        CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY ([MigrationId])
    );
END;

GO

CREATE TABLE [AbpAuditLogs] (
    [Id] bigint NOT NULL IDENTITY,
    [TenantId] int NULL,
    [UserId] bigint NULL,
    [ServiceName] nvarchar(256) NULL,
    [MethodName] nvarchar(256) NULL,
    [Parameters] nvarchar(1024) NULL,
    [ReturnValue] nvarchar(max) NULL,
    [ExecutionTime] datetime2 NOT NULL,
    [ExecutionDuration] int NOT NULL,
    [ClientIpAddress] nvarchar(64) NULL,
    [ClientName] nvarchar(128) NULL,
    [BrowserInfo] nvarchar(512) NULL,
    [Exception] nvarchar(2000) NULL,
    [ImpersonatorUserId] bigint NULL,
    [ImpersonatorTenantId] int NULL,
    [CustomData] nvarchar(2000) NULL,
    CONSTRAINT [PK_AbpAuditLogs] PRIMARY KEY ([Id])
);

GO

CREATE TABLE [AbpBackgroundJobs] (
    [Id] bigint NOT NULL IDENTITY,
    [CreationTime] datetime2 NOT NULL,
    [CreatorUserId] bigint NULL,
    [JobType] nvarchar(512) NOT NULL,
    [JobArgs] nvarchar(max) NOT NULL,
    [TryCount] smallint NOT NULL,
    [NextTryTime] datetime2 NOT NULL,
    [LastTryTime] datetime2 NULL,
    [IsAbandoned] bit NOT NULL,
    [Priority] tinyint NOT NULL,
    CONSTRAINT [PK_AbpBackgroundJobs] PRIMARY KEY ([Id])
);

GO

CREATE TABLE [AbpEditions] (
    [Id] int NOT NULL IDENTITY,
    [CreationTime] datetime2 NOT NULL,
    [CreatorUserId] bigint NULL,
    [LastModificationTime] datetime2 NULL,
    [LastModifierUserId] bigint NULL,
    [IsDeleted] bit NOT NULL,
    [DeleterUserId] bigint NULL,
    [DeletionTime] datetime2 NULL,
    [Name] nvarchar(32) NOT NULL,
    [DisplayName] nvarchar(64) NOT NULL,
    CONSTRAINT [PK_AbpEditions] PRIMARY KEY ([Id])
);

GO

CREATE TABLE [AbpEntityChangeSets] (
    [Id] bigint NOT NULL IDENTITY,
    [BrowserInfo] nvarchar(512) NULL,
    [ClientIpAddress] nvarchar(64) NULL,
    [ClientName] nvarchar(128) NULL,
    [CreationTime] datetime2 NOT NULL,
    [ExtensionData] nvarchar(max) NULL,
    [ImpersonatorTenantId] int NULL,
    [ImpersonatorUserId] bigint NULL,
    [Reason] nvarchar(256) NULL,
    [TenantId] int NULL,
    [UserId] bigint NULL,
    CONSTRAINT [PK_AbpEntityChangeSets] PRIMARY KEY ([Id])
);

GO

CREATE TABLE [AbpLanguages] (
    [Id] int NOT NULL IDENTITY,
    [CreationTime] datetime2 NOT NULL,
    [CreatorUserId] bigint NULL,
    [LastModificationTime] datetime2 NULL,
    [LastModifierUserId] bigint NULL,
    [IsDeleted] bit NOT NULL,
    [DeleterUserId] bigint NULL,
    [DeletionTime] datetime2 NULL,
    [TenantId] int NULL,
    [Name] nvarchar(10) NOT NULL,
    [DisplayName] nvarchar(64) NOT NULL,
    [Icon] nvarchar(128) NULL,
    [IsDisabled] bit NOT NULL,
    CONSTRAINT [PK_AbpLanguages] PRIMARY KEY ([Id])
);

GO

CREATE TABLE [AbpLanguageTexts] (
    [Id] bigint NOT NULL IDENTITY,
    [CreationTime] datetime2 NOT NULL,
    [CreatorUserId] bigint NULL,
    [LastModificationTime] datetime2 NULL,
    [LastModifierUserId] bigint NULL,
    [TenantId] int NULL,
    [LanguageName] nvarchar(10) NOT NULL,
    [Source] nvarchar(128) NOT NULL,
    [Key] nvarchar(256) NOT NULL,
    [Value] nvarchar(max) NOT NULL,
    CONSTRAINT [PK_AbpLanguageTexts] PRIMARY KEY ([Id])
);

GO

CREATE TABLE [AbpNotifications] (
    [Id] uniqueidentifier NOT NULL,
    [CreationTime] datetime2 NOT NULL,
    [CreatorUserId] bigint NULL,
    [NotificationName] nvarchar(96) NOT NULL,
    [Data] nvarchar(max) NULL,
    [DataTypeName] nvarchar(512) NULL,
    [EntityTypeName] nvarchar(250) NULL,
    [EntityTypeAssemblyQualifiedName] nvarchar(512) NULL,
    [EntityId] nvarchar(96) NULL,
    [Severity] tinyint NOT NULL,
    [UserIds] nvarchar(max) NULL,
    [ExcludedUserIds] nvarchar(max) NULL,
    [TenantIds] nvarchar(max) NULL,
    CONSTRAINT [PK_AbpNotifications] PRIMARY KEY ([Id])
);

GO

CREATE TABLE [AbpNotificationSubscriptions] (
    [Id] uniqueidentifier NOT NULL,
    [CreationTime] datetime2 NOT NULL,
    [CreatorUserId] bigint NULL,
    [TenantId] int NULL,
    [UserId] bigint NOT NULL,
    [NotificationName] nvarchar(96) NULL,
    [EntityTypeName] nvarchar(250) NULL,
    [EntityTypeAssemblyQualifiedName] nvarchar(512) NULL,
    [EntityId] nvarchar(96) NULL,
    CONSTRAINT [PK_AbpNotificationSubscriptions] PRIMARY KEY ([Id])
);

GO

CREATE TABLE [AbpOrganizationUnitRoles] (
    [Id] bigint NOT NULL IDENTITY,
    [CreationTime] datetime2 NOT NULL,
    [CreatorUserId] bigint NULL,
    [TenantId] int NULL,
    [RoleId] int NOT NULL,
    [OrganizationUnitId] bigint NOT NULL,
    [IsDeleted] bit NOT NULL,
    CONSTRAINT [PK_AbpOrganizationUnitRoles] PRIMARY KEY ([Id])
);

GO

CREATE TABLE [AbpOrganizationUnits] (
    [Id] bigint NOT NULL IDENTITY,
    [CreationTime] datetime2 NOT NULL,
    [CreatorUserId] bigint NULL,
    [LastModificationTime] datetime2 NULL,
    [LastModifierUserId] bigint NULL,
    [IsDeleted] bit NOT NULL,
    [DeleterUserId] bigint NULL,
    [DeletionTime] datetime2 NULL,
    [TenantId] int NULL,
    [ParentId] bigint NULL,
    [Code] nvarchar(95) NOT NULL,
    [DisplayName] nvarchar(128) NOT NULL,
    CONSTRAINT [PK_AbpOrganizationUnits] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_AbpOrganizationUnits_AbpOrganizationUnits_ParentId] FOREIGN KEY ([ParentId]) REFERENCES [AbpOrganizationUnits] ([Id]) ON DELETE NO ACTION
);

GO

CREATE TABLE [AbpTenantNotifications] (
    [Id] uniqueidentifier NOT NULL,
    [CreationTime] datetime2 NOT NULL,
    [CreatorUserId] bigint NULL,
    [TenantId] int NULL,
    [NotificationName] nvarchar(96) NOT NULL,
    [Data] nvarchar(max) NULL,
    [DataTypeName] nvarchar(512) NULL,
    [EntityTypeName] nvarchar(250) NULL,
    [EntityTypeAssemblyQualifiedName] nvarchar(512) NULL,
    [EntityId] nvarchar(96) NULL,
    [Severity] tinyint NOT NULL,
    CONSTRAINT [PK_AbpTenantNotifications] PRIMARY KEY ([Id])
);

GO

CREATE TABLE [AbpUserAccounts] (
    [Id] bigint NOT NULL IDENTITY,
    [CreationTime] datetime2 NOT NULL,
    [CreatorUserId] bigint NULL,
    [LastModificationTime] datetime2 NULL,
    [LastModifierUserId] bigint NULL,
    [IsDeleted] bit NOT NULL,
    [DeleterUserId] bigint NULL,
    [DeletionTime] datetime2 NULL,
    [TenantId] int NULL,
    [UserId] bigint NOT NULL,
    [UserLinkId] bigint NULL,
    [UserName] nvarchar(256) NULL,
    [EmailAddress] nvarchar(256) NULL,
    CONSTRAINT [PK_AbpUserAccounts] PRIMARY KEY ([Id])
);

GO

CREATE TABLE [AbpUserLoginAttempts] (
    [Id] bigint NOT NULL IDENTITY,
    [TenantId] int NULL,
    [TenancyName] nvarchar(64) NULL,
    [UserId] bigint NULL,
    [UserNameOrEmailAddress] nvarchar(255) NULL,
    [ClientIpAddress] nvarchar(64) NULL,
    [ClientName] nvarchar(128) NULL,
    [BrowserInfo] nvarchar(512) NULL,
    [Result] tinyint NOT NULL,
    [CreationTime] datetime2 NOT NULL,
    CONSTRAINT [PK_AbpUserLoginAttempts] PRIMARY KEY ([Id])
);

GO

CREATE TABLE [AbpUserNotifications] (
    [Id] uniqueidentifier NOT NULL,
    [TenantId] int NULL,
    [UserId] bigint NOT NULL,
    [TenantNotificationId] uniqueidentifier NOT NULL,
    [State] int NOT NULL,
    [CreationTime] datetime2 NOT NULL,
    CONSTRAINT [PK_AbpUserNotifications] PRIMARY KEY ([Id])
);

GO

CREATE TABLE [AbpUserOrganizationUnits] (
    [Id] bigint NOT NULL IDENTITY,
    [CreationTime] datetime2 NOT NULL,
    [CreatorUserId] bigint NULL,
    [TenantId] int NULL,
    [UserId] bigint NOT NULL,
    [OrganizationUnitId] bigint NOT NULL,
    [IsDeleted] bit NOT NULL,
    CONSTRAINT [PK_AbpUserOrganizationUnits] PRIMARY KEY ([Id])
);

GO

CREATE TABLE [AbpUsers] (
    [Id] bigint NOT NULL IDENTITY,
    [CreationTime] datetime2 NOT NULL,
    [CreatorUserId] bigint NULL,
    [LastModificationTime] datetime2 NULL,
    [LastModifierUserId] bigint NULL,
    [IsDeleted] bit NOT NULL,
    [DeleterUserId] bigint NULL,
    [DeletionTime] datetime2 NULL,
    [AuthenticationSource] nvarchar(64) NULL,
    [UserName] nvarchar(256) NOT NULL,
    [TenantId] int NULL,
    [EmailAddress] nvarchar(256) NOT NULL,
    [Name] nvarchar(64) NOT NULL,
    [Surname] nvarchar(64) NOT NULL,
    [Password] nvarchar(128) NOT NULL,
    [EmailConfirmationCode] nvarchar(328) NULL,
    [PasswordResetCode] nvarchar(328) NULL,
    [LockoutEndDateUtc] datetime2 NULL,
    [AccessFailedCount] int NOT NULL,
    [IsLockoutEnabled] bit NOT NULL,
    [PhoneNumber] nvarchar(32) NULL,
    [IsPhoneNumberConfirmed] bit NOT NULL,
    [SecurityStamp] nvarchar(128) NULL,
    [IsTwoFactorEnabled] bit NOT NULL,
    [IsEmailConfirmed] bit NOT NULL,
    [IsActive] bit NOT NULL,
    [NormalizedUserName] nvarchar(256) NOT NULL,
    [NormalizedEmailAddress] nvarchar(256) NOT NULL,
    [ConcurrencyStamp] nvarchar(128) NULL,
    CONSTRAINT [PK_AbpUsers] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_AbpUsers_AbpUsers_CreatorUserId] FOREIGN KEY ([CreatorUserId]) REFERENCES [AbpUsers] ([Id]) ON DELETE NO ACTION,
    CONSTRAINT [FK_AbpUsers_AbpUsers_DeleterUserId] FOREIGN KEY ([DeleterUserId]) REFERENCES [AbpUsers] ([Id]) ON DELETE NO ACTION,
    CONSTRAINT [FK_AbpUsers_AbpUsers_LastModifierUserId] FOREIGN KEY ([LastModifierUserId]) REFERENCES [AbpUsers] ([Id]) ON DELETE NO ACTION
);

GO

CREATE TABLE [AbpFeatures] (
    [Id] bigint NOT NULL IDENTITY,
    [CreationTime] datetime2 NOT NULL,
    [CreatorUserId] bigint NULL,
    [TenantId] int NULL,
    [Name] nvarchar(128) NOT NULL,
    [Value] nvarchar(2000) NOT NULL,
    [Discriminator] nvarchar(max) NOT NULL,
    [EditionId] int NULL,
    CONSTRAINT [PK_AbpFeatures] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_AbpFeatures_AbpEditions_EditionId] FOREIGN KEY ([EditionId]) REFERENCES [AbpEditions] ([Id]) ON DELETE CASCADE
);

GO

CREATE TABLE [AbpEntityChanges] (
    [Id] bigint NOT NULL IDENTITY,
    [ChangeTime] datetime2 NOT NULL,
    [ChangeType] tinyint NOT NULL,
    [EntityChangeSetId] bigint NOT NULL,
    [EntityId] nvarchar(48) NULL,
    [EntityTypeFullName] nvarchar(192) NULL,
    [TenantId] int NULL,
    CONSTRAINT [PK_AbpEntityChanges] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_AbpEntityChanges_AbpEntityChangeSets_EntityChangeSetId] FOREIGN KEY ([EntityChangeSetId]) REFERENCES [AbpEntityChangeSets] ([Id]) ON DELETE CASCADE
);

GO

CREATE TABLE [AbpRoles] (
    [Id] int NOT NULL IDENTITY,
    [CreationTime] datetime2 NOT NULL,
    [CreatorUserId] bigint NULL,
    [LastModificationTime] datetime2 NULL,
    [LastModifierUserId] bigint NULL,
    [IsDeleted] bit NOT NULL,
    [DeleterUserId] bigint NULL,
    [DeletionTime] datetime2 NULL,
    [TenantId] int NULL,
    [Name] nvarchar(32) NOT NULL,
    [DisplayName] nvarchar(64) NOT NULL,
    [IsStatic] bit NOT NULL,
    [IsDefault] bit NOT NULL,
    [NormalizedName] nvarchar(32) NOT NULL,
    [ConcurrencyStamp] nvarchar(128) NULL,
    [Description] nvarchar(max) NULL,
    CONSTRAINT [PK_AbpRoles] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_AbpRoles_AbpUsers_CreatorUserId] FOREIGN KEY ([CreatorUserId]) REFERENCES [AbpUsers] ([Id]) ON DELETE NO ACTION,
    CONSTRAINT [FK_AbpRoles_AbpUsers_DeleterUserId] FOREIGN KEY ([DeleterUserId]) REFERENCES [AbpUsers] ([Id]) ON DELETE NO ACTION,
    CONSTRAINT [FK_AbpRoles_AbpUsers_LastModifierUserId] FOREIGN KEY ([LastModifierUserId]) REFERENCES [AbpUsers] ([Id]) ON DELETE NO ACTION
);

GO

CREATE TABLE [AbpSettings] (
    [Id] bigint NOT NULL IDENTITY,
    [CreationTime] datetime2 NOT NULL,
    [CreatorUserId] bigint NULL,
    [LastModificationTime] datetime2 NULL,
    [LastModifierUserId] bigint NULL,
    [TenantId] int NULL,
    [UserId] bigint NULL,
    [Name] nvarchar(256) NOT NULL,
    [Value] nvarchar(2000) NULL,
    CONSTRAINT [PK_AbpSettings] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_AbpSettings_AbpUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AbpUsers] ([Id]) ON DELETE NO ACTION
);

GO

CREATE TABLE [AbpTenants] (
    [Id] int NOT NULL IDENTITY,
    [CreationTime] datetime2 NOT NULL,
    [CreatorUserId] bigint NULL,
    [LastModificationTime] datetime2 NULL,
    [LastModifierUserId] bigint NULL,
    [IsDeleted] bit NOT NULL,
    [DeleterUserId] bigint NULL,
    [DeletionTime] datetime2 NULL,
    [TenancyName] nvarchar(64) NOT NULL,
    [Name] nvarchar(128) NOT NULL,
    [ConnectionString] nvarchar(1024) NULL,
    [IsActive] bit NOT NULL,
    [EditionId] int NULL,
    CONSTRAINT [PK_AbpTenants] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_AbpTenants_AbpUsers_CreatorUserId] FOREIGN KEY ([CreatorUserId]) REFERENCES [AbpUsers] ([Id]) ON DELETE NO ACTION,
    CONSTRAINT [FK_AbpTenants_AbpUsers_DeleterUserId] FOREIGN KEY ([DeleterUserId]) REFERENCES [AbpUsers] ([Id]) ON DELETE NO ACTION,
    CONSTRAINT [FK_AbpTenants_AbpEditions_EditionId] FOREIGN KEY ([EditionId]) REFERENCES [AbpEditions] ([Id]) ON DELETE NO ACTION,
    CONSTRAINT [FK_AbpTenants_AbpUsers_LastModifierUserId] FOREIGN KEY ([LastModifierUserId]) REFERENCES [AbpUsers] ([Id]) ON DELETE NO ACTION
);

GO

CREATE TABLE [AbpUserClaims] (
    [Id] bigint NOT NULL IDENTITY,
    [CreationTime] datetime2 NOT NULL,
    [CreatorUserId] bigint NULL,
    [TenantId] int NULL,
    [UserId] bigint NOT NULL,
    [ClaimType] nvarchar(256) NULL,
    [ClaimValue] nvarchar(max) NULL,
    CONSTRAINT [PK_AbpUserClaims] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_AbpUserClaims_AbpUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AbpUsers] ([Id]) ON DELETE CASCADE
);

GO

CREATE TABLE [AbpUserLogins] (
    [Id] bigint NOT NULL IDENTITY,
    [TenantId] int NULL,
    [UserId] bigint NOT NULL,
    [LoginProvider] nvarchar(128) NOT NULL,
    [ProviderKey] nvarchar(256) NOT NULL,
    CONSTRAINT [PK_AbpUserLogins] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_AbpUserLogins_AbpUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AbpUsers] ([Id]) ON DELETE CASCADE
);

GO

CREATE TABLE [AbpUserRoles] (
    [Id] bigint NOT NULL IDENTITY,
    [CreationTime] datetime2 NOT NULL,
    [CreatorUserId] bigint NULL,
    [TenantId] int NULL,
    [UserId] bigint NOT NULL,
    [RoleId] int NOT NULL,
    CONSTRAINT [PK_AbpUserRoles] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_AbpUserRoles_AbpUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AbpUsers] ([Id]) ON DELETE CASCADE
);

GO

CREATE TABLE [AbpUserTokens] (
    [Id] bigint NOT NULL IDENTITY,
    [TenantId] int NULL,
    [UserId] bigint NOT NULL,
    [LoginProvider] nvarchar(128) NULL,
    [Name] nvarchar(128) NULL,
    [Value] nvarchar(512) NULL,
    [ExpireDate] datetime2 NULL,
    CONSTRAINT [PK_AbpUserTokens] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_AbpUserTokens_AbpUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AbpUsers] ([Id]) ON DELETE CASCADE
);

GO

CREATE TABLE [AbpEntityPropertyChanges] (
    [Id] bigint NOT NULL IDENTITY,
    [EntityChangeId] bigint NOT NULL,
    [NewValue] nvarchar(512) NULL,
    [OriginalValue] nvarchar(512) NULL,
    [PropertyName] nvarchar(96) NULL,
    [PropertyTypeFullName] nvarchar(192) NULL,
    [TenantId] int NULL,
    CONSTRAINT [PK_AbpEntityPropertyChanges] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_AbpEntityPropertyChanges_AbpEntityChanges_EntityChangeId] FOREIGN KEY ([EntityChangeId]) REFERENCES [AbpEntityChanges] ([Id]) ON DELETE CASCADE
);

GO

CREATE TABLE [AbpPermissions] (
    [Id] bigint NOT NULL IDENTITY,
    [CreationTime] datetime2 NOT NULL,
    [CreatorUserId] bigint NULL,
    [TenantId] int NULL,
    [Name] nvarchar(128) NOT NULL,
    [IsGranted] bit NOT NULL,
    [Discriminator] nvarchar(max) NOT NULL,
    [RoleId] int NULL,
    [UserId] bigint NULL,
    CONSTRAINT [PK_AbpPermissions] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_AbpPermissions_AbpRoles_RoleId] FOREIGN KEY ([RoleId]) REFERENCES [AbpRoles] ([Id]) ON DELETE CASCADE,
    CONSTRAINT [FK_AbpPermissions_AbpUsers_UserId] FOREIGN KEY ([UserId]) REFERENCES [AbpUsers] ([Id]) ON DELETE CASCADE
);

GO

CREATE TABLE [AbpRoleClaims] (
    [Id] bigint NOT NULL IDENTITY,
    [CreationTime] datetime2 NOT NULL,
    [CreatorUserId] bigint NULL,
    [TenantId] int NULL,
    [RoleId] int NOT NULL,
    [ClaimType] nvarchar(256) NULL,
    [ClaimValue] nvarchar(max) NULL,
    CONSTRAINT [PK_AbpRoleClaims] PRIMARY KEY ([Id]),
    CONSTRAINT [FK_AbpRoleClaims_AbpRoles_RoleId] FOREIGN KEY ([RoleId]) REFERENCES [AbpRoles] ([Id]) ON DELETE CASCADE
);

GO

CREATE INDEX [IX_AbpAuditLogs_TenantId_ExecutionDuration] ON [AbpAuditLogs] ([TenantId], [ExecutionDuration]);

GO

CREATE INDEX [IX_AbpAuditLogs_TenantId_ExecutionTime] ON [AbpAuditLogs] ([TenantId], [ExecutionTime]);

GO

CREATE INDEX [IX_AbpAuditLogs_TenantId_UserId] ON [AbpAuditLogs] ([TenantId], [UserId]);

GO

CREATE INDEX [IX_AbpBackgroundJobs_IsAbandoned_NextTryTime] ON [AbpBackgroundJobs] ([IsAbandoned], [NextTryTime]);

GO

CREATE INDEX [IX_AbpEntityChanges_EntityChangeSetId] ON [AbpEntityChanges] ([EntityChangeSetId]);

GO

CREATE INDEX [IX_AbpEntityChanges_EntityTypeFullName_EntityId] ON [AbpEntityChanges] ([EntityTypeFullName], [EntityId]);

GO

CREATE INDEX [IX_AbpEntityChangeSets_TenantId_CreationTime] ON [AbpEntityChangeSets] ([TenantId], [CreationTime]);

GO

CREATE INDEX [IX_AbpEntityChangeSets_TenantId_Reason] ON [AbpEntityChangeSets] ([TenantId], [Reason]);

GO

CREATE INDEX [IX_AbpEntityChangeSets_TenantId_UserId] ON [AbpEntityChangeSets] ([TenantId], [UserId]);

GO

CREATE INDEX [IX_AbpEntityPropertyChanges_EntityChangeId] ON [AbpEntityPropertyChanges] ([EntityChangeId]);

GO

CREATE INDEX [IX_AbpFeatures_EditionId_Name] ON [AbpFeatures] ([EditionId], [Name]);

GO

CREATE INDEX [IX_AbpFeatures_TenantId_Name] ON [AbpFeatures] ([TenantId], [Name]);

GO

CREATE INDEX [IX_AbpLanguages_TenantId_Name] ON [AbpLanguages] ([TenantId], [Name]);

GO

CREATE INDEX [IX_AbpLanguageTexts_TenantId_Source_LanguageName_Key] ON [AbpLanguageTexts] ([TenantId], [Source], [LanguageName], [Key]);

GO

CREATE INDEX [IX_AbpNotificationSubscriptions_NotificationName_EntityTypeName_EntityId_UserId] ON [AbpNotificationSubscriptions] ([NotificationName], [EntityTypeName], [EntityId], [UserId]);

GO

CREATE INDEX [IX_AbpNotificationSubscriptions_TenantId_NotificationName_EntityTypeName_EntityId_UserId] ON [AbpNotificationSubscriptions] ([TenantId], [NotificationName], [EntityTypeName], [EntityId], [UserId]);

GO

CREATE INDEX [IX_AbpOrganizationUnitRoles_TenantId_OrganizationUnitId] ON [AbpOrganizationUnitRoles] ([TenantId], [OrganizationUnitId]);

GO

CREATE INDEX [IX_AbpOrganizationUnitRoles_TenantId_RoleId] ON [AbpOrganizationUnitRoles] ([TenantId], [RoleId]);

GO

CREATE INDEX [IX_AbpOrganizationUnits_ParentId] ON [AbpOrganizationUnits] ([ParentId]);

GO

CREATE INDEX [IX_AbpOrganizationUnits_TenantId_Code] ON [AbpOrganizationUnits] ([TenantId], [Code]);

GO

CREATE INDEX [IX_AbpPermissions_TenantId_Name] ON [AbpPermissions] ([TenantId], [Name]);

GO

CREATE INDEX [IX_AbpPermissions_RoleId] ON [AbpPermissions] ([RoleId]);

GO

CREATE INDEX [IX_AbpPermissions_UserId] ON [AbpPermissions] ([UserId]);

GO

CREATE INDEX [IX_AbpRoleClaims_RoleId] ON [AbpRoleClaims] ([RoleId]);

GO

CREATE INDEX [IX_AbpRoleClaims_TenantId_ClaimType] ON [AbpRoleClaims] ([TenantId], [ClaimType]);

GO

CREATE INDEX [IX_AbpRoles_CreatorUserId] ON [AbpRoles] ([CreatorUserId]);

GO

CREATE INDEX [IX_AbpRoles_DeleterUserId] ON [AbpRoles] ([DeleterUserId]);

GO

CREATE INDEX [IX_AbpRoles_LastModifierUserId] ON [AbpRoles] ([LastModifierUserId]);

GO

CREATE INDEX [IX_AbpRoles_TenantId_NormalizedName] ON [AbpRoles] ([TenantId], [NormalizedName]);

GO

CREATE INDEX [IX_AbpSettings_UserId] ON [AbpSettings] ([UserId]);

GO

CREATE INDEX [IX_AbpSettings_TenantId_Name] ON [AbpSettings] ([TenantId], [Name]);

GO

CREATE INDEX [IX_AbpTenantNotifications_TenantId] ON [AbpTenantNotifications] ([TenantId]);

GO

CREATE INDEX [IX_AbpTenants_CreatorUserId] ON [AbpTenants] ([CreatorUserId]);

GO

CREATE INDEX [IX_AbpTenants_DeleterUserId] ON [AbpTenants] ([DeleterUserId]);

GO

CREATE INDEX [IX_AbpTenants_EditionId] ON [AbpTenants] ([EditionId]);

GO

CREATE INDEX [IX_AbpTenants_LastModifierUserId] ON [AbpTenants] ([LastModifierUserId]);

GO

CREATE INDEX [IX_AbpTenants_TenancyName] ON [AbpTenants] ([TenancyName]);

GO

CREATE INDEX [IX_AbpUserAccounts_EmailAddress] ON [AbpUserAccounts] ([EmailAddress]);

GO

CREATE INDEX [IX_AbpUserAccounts_UserName] ON [AbpUserAccounts] ([UserName]);

GO

CREATE INDEX [IX_AbpUserAccounts_TenantId_EmailAddress] ON [AbpUserAccounts] ([TenantId], [EmailAddress]);

GO

CREATE INDEX [IX_AbpUserAccounts_TenantId_UserId] ON [AbpUserAccounts] ([TenantId], [UserId]);

GO

CREATE INDEX [IX_AbpUserAccounts_TenantId_UserName] ON [AbpUserAccounts] ([TenantId], [UserName]);

GO

CREATE INDEX [IX_AbpUserClaims_UserId] ON [AbpUserClaims] ([UserId]);

GO

CREATE INDEX [IX_AbpUserClaims_TenantId_ClaimType] ON [AbpUserClaims] ([TenantId], [ClaimType]);

GO

CREATE INDEX [IX_AbpUserLoginAttempts_UserId_TenantId] ON [AbpUserLoginAttempts] ([UserId], [TenantId]);

GO

CREATE INDEX [IX_AbpUserLoginAttempts_TenancyName_UserNameOrEmailAddress_Result] ON [AbpUserLoginAttempts] ([TenancyName], [UserNameOrEmailAddress], [Result]);

GO

CREATE INDEX [IX_AbpUserLogins_UserId] ON [AbpUserLogins] ([UserId]);

GO

CREATE INDEX [IX_AbpUserLogins_TenantId_UserId] ON [AbpUserLogins] ([TenantId], [UserId]);

GO

CREATE INDEX [IX_AbpUserLogins_TenantId_LoginProvider_ProviderKey] ON [AbpUserLogins] ([TenantId], [LoginProvider], [ProviderKey]);

GO

CREATE INDEX [IX_AbpUserNotifications_UserId_State_CreationTime] ON [AbpUserNotifications] ([UserId], [State], [CreationTime]);

GO

CREATE INDEX [IX_AbpUserOrganizationUnits_TenantId_OrganizationUnitId] ON [AbpUserOrganizationUnits] ([TenantId], [OrganizationUnitId]);

GO

CREATE INDEX [IX_AbpUserOrganizationUnits_TenantId_UserId] ON [AbpUserOrganizationUnits] ([TenantId], [UserId]);

GO

CREATE INDEX [IX_AbpUserRoles_UserId] ON [AbpUserRoles] ([UserId]);

GO

CREATE INDEX [IX_AbpUserRoles_TenantId_RoleId] ON [AbpUserRoles] ([TenantId], [RoleId]);

GO

CREATE INDEX [IX_AbpUserRoles_TenantId_UserId] ON [AbpUserRoles] ([TenantId], [UserId]);

GO

CREATE INDEX [IX_AbpUsers_CreatorUserId] ON [AbpUsers] ([CreatorUserId]);

GO

CREATE INDEX [IX_AbpUsers_DeleterUserId] ON [AbpUsers] ([DeleterUserId]);

GO

CREATE INDEX [IX_AbpUsers_LastModifierUserId] ON [AbpUsers] ([LastModifierUserId]);

GO

CREATE INDEX [IX_AbpUsers_TenantId_NormalizedEmailAddress] ON [AbpUsers] ([TenantId], [NormalizedEmailAddress]);

GO

CREATE INDEX [IX_AbpUsers_TenantId_NormalizedUserName] ON [AbpUsers] ([TenantId], [NormalizedUserName]);

GO

CREATE INDEX [IX_AbpUserTokens_UserId] ON [AbpUserTokens] ([UserId]);

GO

CREATE INDEX [IX_AbpUserTokens_TenantId_UserId] ON [AbpUserTokens] ([TenantId], [UserId]);

GO

INSERT INTO [__EFMigrationsHistory] ([MigrationId], [ProductVersion])
VALUES (N'20190425015359_init', N'2.2.1-servicing-10028');

GO

