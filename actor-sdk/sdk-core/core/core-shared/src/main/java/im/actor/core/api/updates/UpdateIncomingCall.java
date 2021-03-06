package im.actor.core.api.updates;
/*
 *  Generated by the Actor API Scheme generator.  DO NOT EDIT!
 */

import im.actor.runtime.bser.*;
import im.actor.runtime.collections.*;

import static im.actor.runtime.bser.Utils.*;

import im.actor.core.network.parser.*;

import org.jetbrains.annotations.Nullable;
import org.jetbrains.annotations.NotNull;

import com.google.j2objc.annotations.ObjectiveCName;

import java.io.IOException;
import java.util.List;
import java.util.ArrayList;

import im.actor.core.api.*;

public class UpdateIncomingCall extends Update {

    public static final int HEADER = 0x34;

    public static UpdateIncomingCall fromBytes(byte[] data) throws IOException {
        return Bser.parse(new UpdateIncomingCall(), data);
    }

    private long callId;
    private int uid;

    public UpdateIncomingCall(long callId, int uid) {
        this.callId = callId;
        this.uid = uid;
    }

    public UpdateIncomingCall() {

    }

    public long getCallId() {
        return this.callId;
    }

    public int getUid() {
        return this.uid;
    }

    @Override
    public void parse(BserValues values) throws IOException {
        this.callId = values.getLong(1);
        this.uid = values.getInt(2);
    }

    @Override
    public void serialize(BserWriter writer) throws IOException {
        writer.writeLong(1, this.callId);
        writer.writeInt(2, this.uid);
    }

    @Override
    public String toString() {
        String res = "update IncomingCall{";
        res += "callId=" + this.callId;
        res += ", uid=" + this.uid;
        res += "}";
        return res;
    }

    @Override
    public int getHeaderKey() {
        return HEADER;
    }
}
