package im.actor.core.api.rpc;
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

public class RequestCallInProgress extends Request<ResponseVoid> {

    public static final int HEADER = 0xa24;

    public static RequestCallInProgress fromBytes(byte[] data) throws IOException {
        return Bser.parse(new RequestCallInProgress(), data);
    }

    private long callId;
    private int timeout;

    public RequestCallInProgress(long callId, int timeout) {
        this.callId = callId;
        this.timeout = timeout;
    }

    public RequestCallInProgress() {

    }

    public long getCallId() {
        return this.callId;
    }

    public int getTimeout() {
        return this.timeout;
    }

    @Override
    public void parse(BserValues values) throws IOException {
        this.callId = values.getLong(1);
        this.timeout = values.getInt(2);
    }

    @Override
    public void serialize(BserWriter writer) throws IOException {
        writer.writeLong(1, this.callId);
        writer.writeInt(2, this.timeout);
    }

    @Override
    public String toString() {
        String res = "rpc CallInProgress{";
        res += "callId=" + this.callId;
        res += "}";
        return res;
    }

    @Override
    public int getHeaderKey() {
        return HEADER;
    }
}
